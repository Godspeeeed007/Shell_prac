#!/bin/bash


USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please run with root access"
    exit 1
else
    echo "You are running with root acess"
fi
