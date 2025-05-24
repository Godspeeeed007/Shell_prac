#!/bin/bash

echo "Number of args: $#"
echo "Current directory: $pwd "
echo "user directory: $HOME"
echo "Script name: $0"
echo "PID FOR SCRIPT :$$"
echo "which user is running :$user"
sleep 10 &
echo "Pid for last background query :$!"