#!/bin/bash

source config/app.env

echo "Pushing image to local registry..."

docker push localhost:5001/${IMAGE_NAME}

echo "Image pushed successfully."