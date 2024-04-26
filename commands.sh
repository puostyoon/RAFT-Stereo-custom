# For Heewoo
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene00/rectified/camera01/*/*.png -r=datasets/lhw/20240402/scene00/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene01/rectified/camera01/*/*.png -r=datasets/lhw/20240402/scene01/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene02/rectified/camera01/*/*.png -r=datasets/lhw/20240402/scene02/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene00/rectified_gamma_22/camera01/*/*.png -r=datasets/lhw/20240402/scene00/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene01/rectified_gamma_22/camera01/*/*.png -r=datasets/lhw/20240402/scene01/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene02/rectified_gamma_22/camera01/*/*.png -r=datasets/lhw/20240402/scene02/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene00/rectified_gamma_35/camera01/*/*.png -r=datasets/lhw/20240402/scene00/rectified_gamma_35/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene01/rectified_gamma_35/camera01/*/*.png -r=datasets/lhw/20240402/scene01/rectified_gamma_35/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --valid_iters 200 --context_norm instance -l=datasets/lhw/20240402/scene02/rectified_gamma_35/camera01/*/*.png -r=datasets/lhw/20240402/scene02/rectified_gamma_35/camera02/*/*.png
# echo "iraftstereo(rvc) finished"
python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/lhw/dynamic_scene/rectified/camera1/*/*.png -r=datasets/lhw/dynamic_scene/rectified/camera2/*/*.png
echo "iraftstereo(rvc) finished"

# For Suhyun
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene00/rectified/camera01/*/*.png -r=datasets/ssh/20240312/scene00/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene01/rectified/camera01/*/*.png -r=datasets/ssh/20240312/scene01/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene02/rectified/camera01/*/*.png -r=datasets/ssh/20240312/scene02/rectified/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene00/rectified_gamma_22/camera01/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene01/rectified_gamma_22/camera01/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene02/rectified_gamma_22/camera01/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_22/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene00/rectified_gamma_35/camera01/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_35/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene01/rectified_gamma_35/camera01/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_35/camera02/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance --horizontal_flip -l=datasets/ssh/20240312/scene02/rectified_gamma_35/camera01/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_35/camera02/*/*.png
# echo "iraftstereo(rvc) finished"
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene00/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene01/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene02/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene00/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene01/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene02/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene00/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_35/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene01/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_35/camera01/*/*.png
# python demo.py --restore_ckpt models/iraftstereo_rvc.pth --context_norm instance -l=datasets/ssh/20240312/scene02/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_35/camera01/*/*.png
# echo "iraftstereo(rvc) finished"
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene00/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene01/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene02/rectified/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene00/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene01/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene02/rectified_gamma_22/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_22/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene00/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene00/rectified_gamma_35/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene01/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene01/rectified_gamma_35/camera01/*/*.png
# python demo.py --restore_ckpt models/raftstereo_carla.pth --corr_implementation alt --mixed_precision -l=datasets/ssh/20240312/scene02/rectified_gamma_35/camera02/*/*.png -r=datasets/ssh/20240312/scene02/rectified_gamma_35/camera01/*/*.png
# echo "raftstereo_carla finished"