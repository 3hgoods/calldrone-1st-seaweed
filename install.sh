#!/bin/bash


# ref https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-install-Docker-and-docker-compose-on-Ubuntu

sudo apt-get remove docker docker-engine docker.io containerd runc -y

### Docker and docker compose prerequisites
sudo apt-get install curl -y
sudo apt-get install gnupg -y
sudo apt-get install ca-certificates -y
sudo apt-get install lsb-release -y

### Download the docker gpg file to Ubuntu
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

### Add Docker and docker compose support to the Ubuntu's packages list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

### Verify the Docker and docker compose install on Ubuntu
sudo docker run hello-world


git clone https://github.com/IoTKETI/Mobius.git

cd Mobius

sudo npm install

cd ..

mkdir config
cp ./mosquitto.conf ./config

sudo docker-compose up --no-start

echo -e "\n===========Result of Mobius docker install==============\n"
sudo docker-compose ps
echo -e "\n========================================================\n"


