#!/bin/bash

echo "=== DevOps Home Lab Setup ==="

# Detect the distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Cannot detect OS. Exiting."
    exit 1
fi

echo "Detected OS: $DISTRO"

# Install based on distro
install_packages() {
    case $DISTRO in
        ubuntu|debian|linuxmint)
            echo "[1/4] Updating system..."
            sudo apt update -y
            echo "[2/4] Installing Python3 and pip..."
            sudo apt install python3 python3-pip -y
            ;;
        centos|rhel|fedora)
            echo "[1/4] Updating system..."
            sudo dnf update -y
            echo "[2/4] Installing Python3 and pip..."
            sudo dnf install python3 python3-pip -y
            ;;
        arch|manjaro)
            echo "[1/4] Updating system..."
            sudo pacman -Syu --noconfirm
            echo "[2/4] Installing Python3 and pip..."
            sudo pacman -S python python-pip --noconfirm
            ;;
        *)
            echo "Unsupported distro: $DISTRO"
            exit 1
            ;;
    esac
}

install_packages

echo "[3/4] Installing Flask and psutil..."
pip3 install flask psutil --break-system-packages 2>/dev/null || pip3 install flask psutil

echo "[4/4] Starting the app..."
python3 app/app.py
