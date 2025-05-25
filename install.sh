#!/bin/bash


USER=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGS_FOLDER="$PWD"
LOG_FILENAME=$(echo $0 | cut -d '.' -f1).log

mkdir -p "$LOGS_FOLDER"

TIMESTAMP=$(date)

echo "executed at :$TIMESTAMP" &>>$LOG_FILENAME

if [ $USER -eq 0 ]
then
    echo -e $G You are running with root acess$N &>>$LOG_FILENAME

    dnf list installed mysql 
    if [ $? -eq 0 ]
    then 
        echo -e $G Already Mysql installed$N &>>$LOG_FILENAME
        dnf remove mysql -y
    else
        echo -e $R Not there...mysql is getting installed$N &>>$LOG_FILENAME
        dnf install mysql -y 
        validate(){ 
        if [ $? -eq 0 ]
        then 
        echo -e $G $2 Installed$N &>>$LOG_FILENAME
        else 
        echo -e $R $2  Not Installed$N &>>$LOG_FILENAME
        exit 1
        fi
    }  
    fi

    dnf list installed nginx
    if [ $? -eq 0 ]
    then 
        echo -e $G Already Installed$N &>>$LOG_FILENAME
        dnf remove nginx -y
    else
        echo -e $R nginx is not installed...nginx is getting installed$N &>>$LOG_FILENAME
        dnf install nginx -y
        validate $? nginx &>>$LOG_FILENAME
    fi

else
    echo "Please run with root access ex :sudo <file name>" &>>$LOG_FILENAME

    exit 1
fi




