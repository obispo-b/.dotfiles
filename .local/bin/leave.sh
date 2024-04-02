#!/bin/bash

choice=$(printf '󰤄 Suspend\n Reboot\n Shutdown\n Lock\n Log out' | dmenu -p "" -i -fn 'JetBrains Mono Nerd Font')

case $choice in
  '󰤄 Suspend')
    systemctl suspend
    ;;
  ' Reboot')
    systemctl reboot
    ;;
  ' Shutdown')
    systemctl poweroff
    ;;
  ' Lock')
    swaylock
    ;;
  ' Log out')
    sway exit
    ;;
esac
