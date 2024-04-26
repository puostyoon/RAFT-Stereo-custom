import os
import glob
import numpy as np
import cv2
import scipy.io as io
import matplotlib.pyplot as plt
import tqdm

user = 'lhw' # ssh or lhw
folder_name = 'lhw-rvc'
root = os.path.join('demo_output', folder_name)

# Load parameters
if user == 'lhw':
    cam_H, cam_W = 654, 1124
elif user == "ssh":
    cam_H, cam_W = 768, 1024

cameraMatrix1 = np.load(os.path.join('camera_params', user, 'cam1_P.npy')) # rectified camera
T = io.loadmat(os.path.join('camera_params', user, 'translation.mat'))['T'] # original camera

# In suhyun's setup, cam2 is located in the left side of the cam1.

# conversion formula: https://github.com/princeton-vl/RAFT-Stereo.
# In this setup, assume c_x0 - c_x1 = 0
# In this code, every unit is in mm or pixel. (pixel_pitch=6.9um=6.9*1e-3mm)
# translation matrix unit is in mm.
# In suhyun's setup, depth image unit is m. In Heewo's setup, depth image unit is mm.
# camera intrinsic matrix unit is pixel.

# depth image is based on left camera(cam1) in LHW, while basing on right image(cam2) in SSH
focal_length = cameraMatrix1[0][0] # in pixel
baseline = np.sqrt(T[0][0]**2 + T[0][1]**2 + T[0][2]**2) # in mm
principal_points_difference = 0

fname_list = glob.glob(os.path.join(root, '*.npy'))
os.makedirs(os.path.join(root, 'depth_converted'), exist_ok=True)
for fname in tqdm.tqdm(fname_list):
    disparity = np.load(fname) # in pixel
    depth = focal_length * baseline / abs(disparity - principal_points_difference) # in mm 
    plt.imshow(depth, vmin=600, vmax=1200, cmap='jet')
    plt.colorbar(fraction=0.03, pad=0.04)
    plt.title('Depth map (mm)', fontdict = {'fontsize' : 18})
    plt.axis('off')
    plt.savefig(os.path.join(root, 'depth_converted', os.path.basename(fname[:-4])+'_depth_mm.png'), bbox_inches='tight', dpi=400)
    np.save(os.path.join(root, 'depth_converted', os.path.basename(fname[:-4])+'_depth_mm.npy'), depth)
    plt.clf()