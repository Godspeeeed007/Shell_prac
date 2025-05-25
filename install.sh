#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root acess"

    validate(){ 
        if[ $? -eq 0 ]
        then 
        echo -e "\e[31m $2 is present"
        exit 1
        else 
        echo -e "\e[31m $2 is not present"
        fi
    }

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo "IT IS ALREADY THERE"
        exit 0
    else
        echo "Not there...mysql is getting installed"
        dnf install mysql -y
        validate $? mysql   
    fi

    dnf list installed nginx
    if [ $? -ne 0 ]
    then 
        echo -e "\e[32m IT IS ALREADY THERE"
        exit 0
    else
        echo -e "\e[31m Not there...mysql is getting installed"
        dnf install nginx -y
        validate $? nginx   
    fi

else
    echo "Please run with root access ex :sudo <file name>"

    exit 1
fi




