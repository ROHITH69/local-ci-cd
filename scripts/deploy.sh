#!/bin/bash

source config/app.env

echo "Removing existing container if present..."

docker rm -f ${CONTAINER_NAME} || true

echo "Starting application container..."

docker run -d \
--name ${CONTAINER_NAME} \
-p ${HOST_PORT}:${APP_PORT} \
${IMAGE_NAME}:${IMAGE_TAG}

echo "Deployment completed successfully."


```#!/bin/bash
set -e
echo "Deploying application to Kubernetes..."
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl rollout status deployment/myapp -n devenv
kubectl get pods -n devenv
kubectl get svc -n devenv
echo "Deployment successful!"
```