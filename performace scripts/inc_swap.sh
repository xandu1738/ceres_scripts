#! /usr/bin/bash
swapon --show
sudo swapoff /swapfile
sudo fallocate -l 25G /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -h
