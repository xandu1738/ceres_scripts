#! /usr/bin/bash

size=$1
swapon --show
sudo swapoff /swapfile
sudo fallocate -l $sizeG /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -h
