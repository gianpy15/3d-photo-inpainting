ln -s /models checkpoints
docker run --rm -v $(pwd):/workspace 3d-imahe-inpainting python main.py --config argument.yml
