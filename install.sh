#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root acess"

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo "IT IS ALREADY THERE"
    else
        echo "Not there...mysql is getting installed"
        dnf install mysql -y 
        validate(){ 
        if [ $? -eq 0 ]
        then 
        echo -e "\e[32m $2 is present"
        else 
        echo -e "\e[31m $2 is not present"
        exit 1
        fi
    }  
    fi

    dnf list installed nginx
    if [ $? -eq 0 ]
    then 
        echo -e "\e[32m IT IS ALREADY THERE"
        exit 0
    else
        echo -e "\e[31m Not there...nginx is getting installed]"
        dnf install nginx -y
        validate $? nginx   
    fi

else
    echo "Please run with root access ex :sudo <file name>"

    exit 1
fi




