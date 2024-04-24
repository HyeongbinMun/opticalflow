# gmflow-scale2-regrefine6, inference on image dir
CUDA_VISIBLE_DEVICES=4 python main_flow.py \
--inference_dir demo/flow-davis \
--resume /data/dataset/optical/models/gmflow/pretrained/gmflow-scale2-regrefine6-mixdata-train320x576-4e7b215d.pth \
--output_path output/gmflow-scale2-regrefine6-davis \
--padding_factor 32 \
--upsample_factor 4 \
--num_scales 2 \
--attn_splits_list 2 8 \
--corr_radius_list -1 4 \
--prop_radius_list -1 1 \
--reg_refine \
--num_reg_refine 6
