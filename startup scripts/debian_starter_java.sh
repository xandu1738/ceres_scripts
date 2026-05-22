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

echo "[*] Installing default Java"
sudo apt install default-jre
sudo apt install default-jdk

echo "[+] Installing Java 8"
sudo apt install openjdk-8-jre
sudo apt install openjdk-8-jdk

echo "[+] Installing Java 11"
sudo apt install default-jdk

echo "[+] Installing Java 17"
sudo apt install openjdk-17-jre
sudo apt install openjdk-17-jdk	

echo "[+] Installing Java 21"
sudo apt install openjdk-21-jre
sudo apt install openjdk-21-jdk

echo "[+] setting default java version "
sudo update-alternatives --config java

echo "[+] Installing PostgreSQL"
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

sudo apt-get install curl

echo "[*] DBeaver"
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update && sudo apt install dbeaver-ce


echo "[+] Installing snap apps"
sudo snap install spotify --classic
sudo snap install skype --classic
sudo snap install brave --classic
sudo snap install discord --classic
sudo snap install intellij-idea-ultimate --classic
