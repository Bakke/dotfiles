#!/bin/bash

# Create wordlists directory
sudo mkdir -p /usr/share/wordlists

# Get SecLists
sudo git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/seclists

# Get Kali wordlists
wget https://github.com/3ndG4me/KaliLists/archive/refs/heads/master.zip
unzip master.zip
sudo mv KaliLists-master/* /usr/share/wordlists

# Clean up
rm -rf master.zip KaliLists-master
