#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root acess"

    dnf module list mysql -y
    
else
    echo "Please run with root access"
    exit 1
fi




