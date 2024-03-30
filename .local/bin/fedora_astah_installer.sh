#!/bin/bash

<<<<<<< HEAD
adoptiumrepo="[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/fedora/39/x86_64/
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public"

<<<<<<< HEAD
echo "$adoptiumrepo" | sudo tee -a /etc/yum.repos.d/adoptium.repo >/dev/null

sudo dnf install temurin-8-jdk
=======
echo "$adoptiumrepo" > /etc/yum.repos.d/adoptium.repo

sudo dnf install -y temurin-8-jdk
>>>>>>> main

wget -P /tmp https://cdn.change-vision.com/files/astah-uml-9.2.0.0248cd-0.noarch.rpm

rpm -ivh --nosignature /tmp/astah-uml-9.2.0.0248cd-0.noarch.rpm
<<<<<<< HEAD

=======
>>>>>>> main
=======
sudo dnf install java-1.8.0-openjdk
wget -P /tmp https://cdn.change-vision.com/files/astah-uml-9.2.0.0248cd-0.noarch.rpm
sudo rpm -ivh --nosignature /tmp/astah-uml-9.2.0.0248cd-0.noarch.rpm
>>>>>>> main
