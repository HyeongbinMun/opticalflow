NUM_GPUS=1

# kitti
CHECKPOINT_DIR=/data/dataset/optical/models/gmflow/train/gmflow_scale2_kitti && \
mkdir -p ${CHECKPOINT_DIR} && \
env CUDA_VISIBLE_DEVICES=4 python -m torch.distributed.launch --nproc_per_node=${NUM_GPUS} --master_port=9989 main_flow.py \
--launcher pytorch \
--checkpoint_dir ${CHECKPOINT_DIR} \
--stage kitti \
--batch_size 4 \
--val_dataset kitti \
--lr 2e-4 \
--image_size 320 1152 \
--padding_factor 32 \
--upsample_factor 4 \
--num_scales 2 \
--attn_splits_list 2 8 \
--corr_radius_list -1 4 \
--prop_radius_list -1 1 \
--with_speed_metric \
--val_freq 1000 \
--save_ckpt_freq 2000 \
--num_steps 10000 \
2>&1 | tee -a ${CHECKPOINT_DIR}/train.log
