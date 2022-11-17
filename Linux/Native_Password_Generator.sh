#!/bin/bash

#################
## Script: NativePasswordGenerator
## Author: Thamir Alshammari
## Note: any change to this script possiblty make it non-usable. You use it on your own risk.
#################

type=""
group=""
password_length=0
password=""


echo
echo 1- Numeric
echo 2- Alphabet
echo 3- Alphanumeric
echo 4- Complex
echo


while [ "$type" != "1" ] && [ "$type" != "2" ] && [ "$type" != "3" ] && [ "$type" != "4" ]
do
    printf "Choose Password Combination (1-4): ";    
    read type;  
done


while [ $password_length -le 0 ]
do
    printf "Choose Password Length: ";  
    read password_length;
done

 
if [ "$type" == "1" ]; then group="0123456789"
fi
if [ "$type" == "2" ]; then group="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
fi
if [ "$type" == "3" ]; then group="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
fi
if [ "$type" == "4" ]; then group="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!&_%#$*@*+-^[]"
fi

for (( i = 1 ; i <= $password_length ; i++ ))
do
	   c=${#group}-1
       r=$(( ( RANDOM % $c )  + 1 ))
       p=${group:$r:1} 
       password=$password$p   
done

echo
echo "Password:"
echo $password
echo
