#!/bin/bash
cd /home/ares
sudo apt update -y
sudo apt install lldpd python3 python3-pip python3-dev python3-venv python3-flask -y
pip install Flask
sudo ufw allow 5000
wget https://raw.githubusercontent.com/dmlxe/ares/main/app.py
wget https://raw.githubusercontent.com/dmlxe/ares/main/out.sh
sudo chmod 755 out.sh
wget https://raw.githubusercontent.com/dmlxe/ares/main/boot.sh
sudo chmod 755 boot.sh
wget https://raw.githubusercontent.com/dmlxe/ares/main/boot.service
boot_service_file="boot.service"
destination_directory="/etc/systemd/system/"
absolute_boot_service_file="$(pwd)/$boot_service_file"
sudo cp "$absolute_boot_service_file" "$destination_directory"
sudo chmod 755 "$destination_directory/boot.service"
sudo systemctl daemon-reload
sudo systemctl enable boot.service
sudo systemctl start boot.service
