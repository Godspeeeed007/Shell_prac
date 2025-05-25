#!/bin/bash


USER=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGS_FOLDER="$PWD"
LOG_FILENAME=$($0 | cut -d '.' -f1)

mkdir -p "$LOGS_FOLDER/$LOG_FILENAME".log

TIMESTAMP=$(date)

echo "executed at :$TIMESTAMP"

if [ $USER -eq 0 ]
then
    echo -e $G You are running with root acess$N

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo -e $G Already Mysql installed$N
        dnf remove mysql -y
    else
        echo -e $R Not there...mysql is getting installed$N
        dnf install mysql -y 
        validate(){ 
        if [ $? -eq 0 ]
        then 
        echo -e $G $2 Installed$N
        else 
        echo -e $R $2  Not Installed$N
        exit 1
        fi
    }  
    fi

    dnf list installed nginx
    if [ $? -eq 0 ]
    then 
        echo -e $G Already Installed$N
        dnf remove nginx -y
    else
        echo -e $R nginx is not installed...nginx is getting installed$N
        dnf install nginx -y
        validate $? nginx   
    fi

else
    echo "Please run with root access ex :sudo <file name>"

    exit 1
fi




