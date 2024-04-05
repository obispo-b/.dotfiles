#!/usr/bin/env bash

set -e
set -x

git clone https://github.com/oracle/docker-images.git /tmp/docker-images
/tmp/docker-images/OracleDatabase/SingleInstance/dockerfiles/buildContainerImage.sh -v 21.3.0 -x -p
mkdir -p ~/Database
chmod 777 ~/Database

# docker run --name database \
# 	-p 1521:1521 -p 5500:5500 -p 2484:2484 \
# 	-e ORACLE_PWD=123 \
# 	-e ORACLE_CHARACTERSET=AL32UTF8 \
# 	-v /home/Database:/opt/oracle/oradata \
# 	oracle/database:21.3.0-xe
