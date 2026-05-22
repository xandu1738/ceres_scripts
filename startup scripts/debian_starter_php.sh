#! /bin/bash
echo " ██████╗ ██╗  ██╗    ██╗    ██╗██╗  ██╗███████╗███╗   ██╗
      ██╔═══██╗██║  ██║    ██║    ██║██║  ██║██╔════╝████╗  ██║
      ██║   ██║███████║    ██║ █╗ ██║███████║█████╗  ██╔██╗ ██║
      ██║   ██║██╔══██║    ██║███╗██║██╔══██║██╔══╝  ██║╚██╗██║
      ╚██████╔╝██║  ██║    ╚███╔███╔╝██║  ██║███████╗██║ ╚████║
       ╚═════╝ ╚═╝  ╚═╝     ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝"

echo "[+] Updating and upgrading"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git

echo "[*] Nginx"
sudo apt update
sudo apt install nginx
sudo systemctl -l enable nginx
sudo systemctl -l start nginx
sudo systemctl -l status nginx

sudo apt-get update

echo "[*] Installing Curl"
sudo apt install curl

sudo apt-get update

echo "[+] Installing PostgreSQL"
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

sudo apt-get update

echo "[*] DBeaver"
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update && sudo apt install dbeaver-ce

sudo apt-get update

echo "[+] PHP Installations"
sudo apt-get install software-properties-common
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update

sudo apt -y install php7.0-fpm php7.0-bcmath php7.0-curl php7.0-gd php7.0-mbstring php7.0-mysql php7.0-xml php7.0-zip  php7.0-pgsql
sudo apt -y install php7.1-fpm php7.1-bcmath php7.1-curl php7.1-gd php7.1-mbstring php7.1-mysql php7.1-xml php7.1-zip  php7.1-pgsql
sudo apt -y install php7.3-fpm php7.3-bcmath php7.3-curl php7.3-gd php7.3-mbstring php7.3-mysql php7.3-xml php7.3-zip  php7.3-pgsql
sudo apt -y install php7.4-fpm php7.4-bcmath php7.4-curl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-xml php7.4-zip php7.4-pgsql
sudo apt -y install php8.0-fpm php8.0-bcmath php8.0-curl php8.0-gd php8.0-mbstring php8.0-mysql php8.0-xml php8.0-zip  php8.0-pgsql
sudo apt -y install php8.2-fpm php8.2-bcmath php8.2-curl php8.2-gd php8.2-mbstring php8.2-mysql php8.2-xml php8.2-zip  php8.2-pgsql
sudo apt -y install php8.3-fpm php8.3-bcmath php8.3-curl php8.3-gd php8.3-mbstring php8.3-mysql php8.3-xml php8.3-zip  php8.3-pgsql
sudo apt -y install php8.4-fpm php8.4-bcmath php8.4-curl php8.4-gd php8.4-mbstring php8.4-mysql php8.4-xml php8.4-zip  php8.4-pgsql

echo "[+] starting fpm"
sudo service php7.0-fpm start
sudo service php7.1-fpm start
sudo service php7.3-fpm start
sudo service php7.4-fpm start
sudo service php8.0-fpm start
sudo service php8.2-fpm start
sudo service php8.3-fpm start
sudo service php8.4-fpm start

echo "[+] setting default php version "
sudo update-alternatives --config php


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
mv composer.phar ~/.local/bin/composer

echo "[+] Libre office"
sudo apt install libreoffice -y
