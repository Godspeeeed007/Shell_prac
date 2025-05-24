#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root acess"

    dnf list installed mysql -y
    if [ $? -eq 0 ]
    then 
        echo "IT IS ALREADY THERE"
        exit 0
    else
        echo "Not there...mysql is getting installed"
        dnf install mysql -y
        exit 0    
    fi
else
    echo "Please run with root access"
    exit 1
fi




