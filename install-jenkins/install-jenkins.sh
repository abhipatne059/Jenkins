#!/bin/bash 

set -e 

echo "updating packages" 
sudo apt update 

echo "installing java" 
sudo apt install openjdk-21-jdk -y 

echo "installing Jenkins" 
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key 
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null 

sudo apt-get update sudo apt-get install jenkins 

echo "Starting and enabling Jenkins service..." 
sudo systemctl enable jenkins 
sudo systemctl start jenkins

echo "Jenkins installed. Checking status..." 
sudo systemctl status jenkins 

echo "Initial admin password:" 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword