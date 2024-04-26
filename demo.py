import sys
sys.path.append('core')

import argparse
import glob
import numpy as np
import torch
import torchvision.transforms.functional as f
from tqdm import tqdm
from pathlib import Path
from raft_stereo import RAFTStereo
from utils.utils import InputPadder
from PIL import Image
from matplotlib import pyplot as plt

DEVICE = 'cuda'

def load_image(imfile):
    img = np.array(Image.open(imfile)).astype(np.uint8)
    img = torch.from_numpy(img).permute(2, 0, 1).float()
    return img[None].to(DEVICE)

def demo(args):

    global DEVICE 
    DEVICE = args.cuda_device

    model = torch.nn.DataParallel(RAFTStereo(args), device_ids=[int(DEVICE[-1])])
    model.load_state_dict(torch.load(args.restore_ckpt))

    model = model.module
    model.to(torch.device(DEVICE))
    model.eval()
    print(int(DEVICE[-1]), DEVICE)

    output_directory = Path(args.output_directory)
    output_directory.mkdir(exist_ok=True)

    with torch.no_grad():
        left_images = sorted(glob.glob(args.left_imgs, recursive=True))
        right_images = sorted(glob.glob(args.right_imgs, recursive=True))
        count = 0
        print(f"Found {len(left_images)} images. Saving files to {output_directory}/")
        for (imfile1, imfile2) in tqdm(list(zip(left_images, right_images))):
            print(f'left image: {imfile1}')
            print(f'right image: {imfile2}')
            if args.horizontal_flip:
                # apply horizontal flip in addition to exchanging left image and right image
                image1 = f.hflip(load_image(imfile2))
                image2 = f.hflip(load_image(imfile1))
            else:
                image1 = load_image(imfile1)
                image2 = load_image(imfile2)

            padder = InputPadder(image1.shape, divis_by=32)
            image1, image2 = padder.pad(image1, image2)

            _, flow_up = model(image1, image2, iters=args.valid_iters, test_mode=True)
            flow_up = padder.unpad(flow_up).squeeze()

            if args.horizontal_flip:
                flow_up = f.hflip(flow_up)

            file_stem = imfile1.split('/')[-5]+"_"+imfile1.split('/')[-2]+"_"+imfile1.split('/')[-4] + "_" + (str(count) if count!=0 else "0")
            np.save(output_directory / f"{file_stem}.npy", flow_up.cpu().numpy().squeeze())
            plt.imshow(-flow_up.cpu().numpy().squeeze(), cmap='jet', vmin=0, vmax=200)
            plt.colorbar(fraction=0.03, pad=0.04)
            plt.title('Disparity map (pixel)', fontdict = {'fontsize' : 18})
            plt.savefig(output_directory / f"{file_stem}.png", bbox_inches='tight', dpi=400)
            # plt.imsave(output_directory / f"{file_stem}.png", -flow_up.cpu().numpy().squeeze(), cmap='jet')
            plt.clf()
            count += 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--restore_ckpt', help="restore checkpoint", required=True)
    parser.add_argument('--save_numpy', action='store_true', help='save output as numpy arrays')
    parser.add_argument('-l', '--left_imgs', help="path to all first (left) frames", default="datasets/Middlebury/MiddEval3/testH/*/im0.png")
    parser.add_argument('-r', '--right_imgs', help="path to all second (right) frames", default="datasets/Middlebury/MiddEval3/testH/*/im1.png")
    parser.add_argument('--output_directory', help="directory to save output", default="demo_output")
    parser.add_argument('--mixed_precision', action='store_true', help='use mixed precision')
    parser.add_argument('--valid_iters', type=int, default=32, help='number of flow-field updates during forward pass')

    # Default setting is disparity map based on the left image. 
    parser.add_argument('--horizontal_flip', action='store_true', help="Get disparity map based on the right image")

    # Cuda device
    parser.add_argument('--cuda_device', type=str, default='cuda:4', help="cuda device")


    # Architecture choices
    parser.add_argument('--hidden_dims', nargs='+', type=int, default=[128]*3, help="hidden state and context dimensions")
    parser.add_argument('--corr_implementation', choices=["reg", "alt", "reg_cuda", "alt_cuda"], default="reg", help="correlation volume implementation")
    parser.add_argument('--shared_backbone', action='store_true', help="use a single backbone for the context and feature encoders")
    parser.add_argument('--corr_levels', type=int, default=4, help="number of levels in the correlation pyramid")
    parser.add_argument('--corr_radius', type=int, default=4, help="width of the correlation pyramid")
    parser.add_argument('--n_downsample', type=int, default=2, help="resolution of the disparity field (1/2^K)")
    parser.add_argument('--context_norm', type=str, default="batch", choices=['group', 'batch', 'instance', 'none'], help="normalization of context encoder")
    parser.add_argument('--slow_fast_gru', action='store_true', help="iterate the low-res GRUs more frequently")
    parser.add_argument('--n_gru_layers', type=int, default=3, help="number of hidden GRU levels")
    
    args = parser.parse_args()

    demo(args)
