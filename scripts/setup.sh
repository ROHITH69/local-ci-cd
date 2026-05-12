#!/bin/bash

echo "Installing dependencies..."

pip install -r app/requirements.txt || exit 1

echo "Making scripts executable..."

chmod +x scripts/*.sh

echo "Setup completed successfully."