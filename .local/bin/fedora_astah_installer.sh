#!/bin/bash

wget -P /tmp https://cdn.change-vision.com/files/astah-uml-9.2.0.0248cd-0.noarch.rpm

sudo rpm -ivh --nosignature /tmp/astah-uml-9.2.0.0248cd-0.noarch.rpm
