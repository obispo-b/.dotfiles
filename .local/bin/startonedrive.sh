#!/bin/bash

pkill onedrive
sleep 3
systemctl --user start onedrive
