#!/bin/bash

echo "INPUT1:"
read INPUT1
echo "INPUT2:"
read INPUT2

TIMESTAMP=$(date)
echo "Executed at: $TIMESTAMP "

Sum=$(($INPUT1+$INPUT2))

echo " sum of $INPUT1 and $INPUT2 is $Sum and executed at $TIMESTAMP" 