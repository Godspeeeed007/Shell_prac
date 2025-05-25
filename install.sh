#!/bin/bash


USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo -e "\e[31mYou are running with root acess\e[0m"

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo -e "\e[32mMysql installed\e[0m"
        dnf remove mysql -y
    else
        echo -e "\e[31m Not there...mysql is getting installed \e[0m"
        dnf install mysql -y 
        validate(){ 
        if [ $? -eq 0 ]
        then 
        echo -e "\e[32m$2 Installed\e[0m"
        else 
        echo -e "\e[31m$2  Not Installed\e[0m"
        exit 1
        fi
    }  
    fi

    dnf list installed nginx
    if [ $? -eq 0 ]
    then 
        echo -e "\e[32mAlready Installed\e[0m"
        dnf remove nginx -y
    else
        echo -e "\e[31mnginx is not installed...nginx is getting installed\e[0m"
        dnf install nginx -y
        validate $? nginx   
    fi

else
    echo "Please run with root access ex :sudo <file name>"

    exit 1
fi




