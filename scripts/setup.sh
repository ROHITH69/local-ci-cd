#!/bin/bash

echo "Installing dependencies..."

pip install -r app/requirements.txt

echo "Making scripts executable..."

chmod +x scripts/*.sh

echo "Setup completed successfully."