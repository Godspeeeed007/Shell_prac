#!/bin/bash

echo "Number of args: $#"
echo "Current directory: $PWD "
echo "user directory: $HOME"
echo "Script name: $0"
echo "PID FOR SCRIPT :$$"
echo "which user is running :$USER"
sleep 10 &
echo "Pid for last background query :$!"