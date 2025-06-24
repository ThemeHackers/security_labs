#!/bin/bash


install_if_missing() {
  local cmd=$1
  local pkg=$2

  if command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd is already installed."
  else
    echo "$cmd is NOT installed."
    echo "Installing $pkg..."
    sudo apt update
    sudo apt install -y "$pkg"
  fi
}

echo "Checking Docker components..."

install_if_missing docker docker.io


install_if_missing docker-compose docker-compose

if [ -f "Install-DVWA.sh" ]; then
    echo "File Install-DVWA.sh already exists."
else
    echo "Downloading Install-DVWA.sh..."
    wget https://raw.githubusercontent.com/IamCarron/DVWA-Script/main/Install-DVWA.sh

    if [ $? -ne 0 ]; then
        echo "Failed to download Install-DVWA.sh"
        exit 1
    fi

    chmod +x Install-DVWA.sh
fi

echo "Running Install-DVWA.sh script..."
sudo ./Install-DVWA.sh

if [ $? -ne 0 ]; then
    echo "Install-DVWA.sh script failed."
    exit 2
fi


if [ -d "vulhub" ]; then
    echo "Directory 'vulhub' already exists."
else
    echo "Cloning vulhub repository..."
    git clone https://github.com/vulhub/vulhub

    if [ $? -ne 0 ]; then
        echo "Failed to clone vulhub repository."
        exit 3
    fi
fi

echo "Removing Install-DVWA.sh..."
rm -f Install-DVWA.sh

echo "Installation completed successfully."

echo "Update&Upgrade System"

sudo apt update -y
sudo apt full-upgrade -y


