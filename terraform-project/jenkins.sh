#!/bin/bash

# Java Installation
sudo apt update -y
sudo apt install openjdk-17-jre -y
echo "Java version is:"
java -version

# Installing Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]                    \
        https://pkg.jenkins.io/debian-stable binary/ | sudo tee                 \
        /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y
sudo apt-get install jenkins -y

# Jenkins Service Management
sudo systemctl enable jenkins && echo "Jenkins service enabled"
sudo systemctl start jenkins && echo "Jenkins service started"
sudo systemctl status jenkins

# Accessing Jenkins
echo "Access server at: http://localhost:8080"