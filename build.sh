#!/bin/bash
NAME=jonathanporta/tensorflow-base
TF=2.2.0
CUDA=10.0
CUDNN_MAJOR_VERSION=7
CUDNN=7.4.1.5-1
PYTHON_MAJOR_VERSION=3

if [ $PYTHON_MAJOR_VERSION -eq 3 ]
then
  USE_PYTHON_3_NOT_2=1
else
  USE_PYTHON_3_NOT_2=0
fi

TAG="tf_$TF-cuda_$CUDA-cudnn_$CUDNN-py_$PYTHON_MAJOR_VERSION-gpu"

echo "Building container: ${NAME}:${TAG}"

docker build \
  --build-arg TF=$TF \
  --build-arg CUDA=$CUDA \
  --build-arg CUDNN_MAJOR_VERSION=$CUDNN_MAJOR_VERSION \
  --build-arg CUDNN=$CUDNN \
  --build-arg USE_PYTHON_3_NOT_2=$USE_PYTHON_3_NOT_2 \
  -f tf2-gpu.dockerfile \
  -t ${NAME}:${TAG} \
  .

docker push ${NAME}:${TAG}
