# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-joycaption@2.0.2 --mode remote

# download models into comfyui
# RUN # Could not find URL for photorealisticAllPurpose_v40.safetensors
RUN comfy model download --url https://huggingface.co/Lachhhhhhh/Model/resolve/main/xinsirUnionProMax_v10.safetensors --relative-path models/controlnet --filename xinsirUnionProMax_v10.safetensors

RUN comfy model download --url https://huggingface.co/Lachhhhhhh/Model/resolve/main/photorealisticAllPurpose_v40.safetensors --relative-path models/checkpoints --filename photorealisticAllPurpose_v40.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
