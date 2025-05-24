#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root acess"

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo "IT IS ALREADY THERE"
        dnf remove mysql
        exit 0
    else
        echo "Not there...mysql is getting installed"
        #dnf install mysql -y
        dnf list installed mysql > /dev/null 2>&1

        exit 0    
    fi
else
    echo "Please run with root access"
    exit 1
fi




