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
sudo apt install nginx
sudo apt install curl
echo "[+] Installing PostgreSQL"
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

echo "[*] DBeaver"
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update && sudo apt install dbeaver-ce
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4
sudo apt-get install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
mv composer.phar ~/.local/bin/composer
