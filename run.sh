docker run --rm -v $(pwd)/image:/workspace/image -v $(pwd)/video:/workspace/video -v $(pwd)/depth:/workspace/depth --gpus all  3d-photo-inpainting
