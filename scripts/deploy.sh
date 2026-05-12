#!/bin/bash

source config/app.env

echo "Removing existing container if present..."

docker rm -f ${CONTAINER_NAME} || true

echo "Starting application container..."

docker run -d \
  --name ${CONTAINER_NAME} \
  -p ${HOST_PORT}:${APP_PORT} \
  ${IMAGE_NAME}

echo "Deployment completed successfully."