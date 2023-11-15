#!/bin/bash

if [ $# -eq 0 ]; then
  xsetwacom --set "Wacom One by Wacom S Pen stylus" MapToOutput HEAD-0
else
  xsetwacom --set "Wacom One by Wacom S Pen stylus" MapToOutput "HEAD-$1"
fi
