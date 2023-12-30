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
    loginctl lock-session
    ;;
  ' Log out')
    pkill -KILL -u "$USER"
    ;;
esac
