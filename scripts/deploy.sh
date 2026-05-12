#!/bin/bash

PORT=5000

while docker ps --format '{{.Ports}}' | grep -q "0.0.0.0:$PORT->"
do
    PORT=$((PORT+1))
done

echo "Using port $PORT"

docker run -d -p $PORT:5000 rohith-python-app

echo "Application running at http://localhost:$PORT"