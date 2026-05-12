#!/bin/bash

source config/app.env

echo "Stopping application container..."

docker stop ${CONTAINER_NAME} || true

echo "Removing application container..."

docker rm ${CONTAINER_NAME} || true

echo "Cleanup completed successfully."