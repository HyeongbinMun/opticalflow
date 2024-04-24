NUM_GPUS=1

# kitti
CHECKPOINT_DIR=/data/dataset/optical/models/gmflow/train/gmstereo_scale2_kitti && \
mkdir -p ${CHECKPOINT_DIR} && \
env CUDA_VISIBLE_DEVICES=5 python -m torch.distributed.launch --nproc_per_node=${NUM_GPUS} --master_port=9989  main_stereo.py \
--launcher pytorch \
--checkpoint_dir ${CHECKPOINT_DIR} \
--stage kitti15 \
--batch_size 8 \
--val_dataset kitti15 \
--img_height 384 \
--img_width 768 \
--padding_factor 32 \
--upsample_factor 4 \
--num_scales 2 \
--attn_type self_swin2d_cross_swin1d \
--attn_splits_list 2 8 \
--corr_radius_list -1 4 \
--prop_radius_list -1 1 \
--summary_freq 100 \
--val_freq 1000 \
--save_ckpt_freq 1000 \
--save_latest_ckpt_freq 2000 \
--num_steps 10000 \
2>&1 | tee -a ${CHECKPOINT_DIR}/train.log
