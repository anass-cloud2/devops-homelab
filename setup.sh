#!/bin/bash

echo "=== DevOps Home Lab Setup ==="

echo "[1/4] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[2/4] Installing Python3 and pip..."
sudo apt install python3 python3-pip -y

echo "[3/4] Installing Flask..."
pip3 install flask psutil --break-system-packages

echo "[4/4] Starting the app..."
python3 app/app.py
