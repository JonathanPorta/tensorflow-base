echo "Will run '${1}' via Python in a Tensorflow GPU Supported Container!"
docker run \
  --gpus 0,1,2\
  -e NVIDIA_VISIBLE_DEVICES="0,1,2" \
  -v "$(pwd)":/app \
  -it jonathanporta/tf2 bash -c "ldconfig && cd /app && pip install -r requirements.txt && python ${1}"
