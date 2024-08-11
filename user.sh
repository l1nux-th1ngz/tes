#!/bin/bash

# Install required packages
sudo apt-get install -y sudo git

# Extract the username from /etc/passwd
USERNAME=$(awk -F: '{print $1}' /etc/passwd | grep -v '^[^a-zA-Z0-9]*$' | head -n 1)

# Modify the sudoers file
echo "$USERNAME ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo

# Update package lists
sudo apt-get update

# Reboot the system
sudo reboot
