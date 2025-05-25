#!/bin/bash

USER=$(id -u)

if [ $USER -eq 0 ]
then
    echo "You are running with root access"

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo "MySQL is already installed"
        exit 0
    else
        echo "MySQL not found... installing"
        dnf install mysql -y   
    fi

    validate(){ 
        if [ $? -eq 0 ]
        then 
            echo -e "\e[32m$2 is installed successfully"
        else 
            echo -e "\e[31mFailed to install $2"
            exit 1
        fi
    }

    dnf list installed nginx
    if [ $? -eq 0 ]
    then 
        echo -e "\e[32mNginx is already installed"
    else
        echo -e "\e[31mNginx not found... installing"
        dnf install nginx -y
        validate $? nginx   
    fi

else
    echo "Please run with root access, e.g., sudo ./install.sh"
    exit 1
fi
