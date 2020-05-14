echo "Will run an interactive shell in Tensorflow GPU Supported Container!"
docker run \
  --gpus 0,1,2\
  -e NVIDIA_VISIBLE_DEVICES="0,1,2" \
  -v "$(pwd)":/app \
  -it jonathanporta/tf2 bash -c "ldconfig && cd /app && /bin/bash -i"
