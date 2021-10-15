#! /bin/bash

#run this script like: ./simple_arithmetics.sh number1 number2

#Get the numbers:
let number1=$1
let number2=$2

#Addition:
let addition=$number1+$number2

#Extraction:
let extraction=$number1-$number2

#Multiplication:
let multiplication=$number1*$number2

#Division:
let division=$number1/$number2


echo "$number1+$number2 equals: $addition"
echo "$number1-$number2 equals: $extraction"
echo "$number1*$number2 equals: $multiplication"
echo "$number1/$number2 equals: $division"
