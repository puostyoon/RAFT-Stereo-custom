import os
import glob
import numpy as np
import matplotlib.pyplot as plt
import cv2
from tqdm import tqdm

data_dir = os.path.join("datasets", 'lhw', 'dynamic_scene', 'rectified', 'camera1')
disparity_dir = os.path.join("demo_output", 'dynamic-scene-rvc')

os.makedirs(os.path.join(disparity_dir, 'video'), exist_ok=True)
path_out = os.path.join(disparity_dir, 'video', "test_video.mp4")
data_frames_list = glob.glob(os.path.join(data_dir, 's0', '*.png'))
disparity_frames_list = glob.glob(os.path.join(disparity_dir, 's0', '*.png'))
data_frames_list = sorted(data_frames_list, key=lambda x: int(x.split('_')[-1][:-4]))
disparity_frames_list = sorted(disparity_frames_list, key=lambda x: int(x.split('_')[-1][:-4]))
H, W, _ = (plt.imread(data_frames_list[0])).shape
video_out = cv2.VideoWriter(path_out, cv2.VideoWriter_fourcc(*'mp4v'), 30, frameSize=(W*2,H)) #fps=30
for idx, (data_fname, disparity_fname) in enumerate(tqdm(zip(data_frames_list, disparity_frames_list))):
    frame = np.zeros((H, W*2, 3)).astype('uint8')
    frame[:, :W, :] = cv2.imread(data_fname).astype('uint8') 
    frame[:, W:, :] = cv2.resize(cv2.imread(disparity_fname).astype('uint8'), dsize=(W, H))
    #이미지 위에 글자 입히기
    font = cv2.FONT_HERSHEY_SIMPLEX
    white = (255, 255, 255)
    frame = cv2.putText(frame, f'frame :{idx}', (W//2-30, 20), font, 0.5, white, 1)
    # frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    video_out.write(frame)

video_out.release()