#! /bin/bash


#get the information for 8 pm 3/12 --9
echo 8 pm march 12
grep -w "08:00:00 PM" 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
