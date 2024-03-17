#!/bin/bash

adoptiumrepo="[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/fedora/39/x86_64/
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public"

echo "$adoptiumrepo" > /etc/yum.repos.d/adoptium.repo

sudo dnf install -y temurin-8-jdk

wget -P /tmp https://cdn.change-vision.com/files/astah-uml-9.2.0.0248cd-0.noarch.rpm

rpm -ivh --nosignature /tmp/astah-uml-9.2.0.0248cd-0.noarch.rpm
