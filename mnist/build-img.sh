#!/bin/bash
IMAGE_NAME=${1:-docker.elenet.me/jun.jiang02/tf-demo}
IMAGE_TAG=$(date +%Y%m%d_%H%M%S)

if [ ! -f ./data/eval.tfr.gz ]; then
	wget -O ./data/eval.tfr.gz https://github.com/ohmystack/cloudml-samples/releases/download/gs-files/eval.tfr.gz
fi
if [ ! -f ./data/train.tfr.gz ]; then
	wget -O ./data/train.tfr.gz https://github.com/ohmystack/cloudml-samples/releases/download/gs-files/train.tfr.gz
fi

docker build --force-rm -t $IMAGE_NAME:$IMAGE_TAG .

if [ $? -eq 0 ]; then
	echo "=================================="
	echo "Image Name:"
	echo "  $IMAGE_NAME:$IMAGE_TAG"
	echo "=================================="
fi
