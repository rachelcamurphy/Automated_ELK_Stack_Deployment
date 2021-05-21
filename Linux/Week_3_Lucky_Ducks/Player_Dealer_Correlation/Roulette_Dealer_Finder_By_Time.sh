
#!/bin/sh
#Rachel Murphy 
#Homework 3 Homework : A High Stakes Investigation
#This script will accept arguments for date, time, am/pm, and output the Roulette Dealer that was working.

cat DEALER_SCHEDULE_FINAL | awk -F " " '{print $1, $2, $3, $4, $5, $6}' | grep "$2" 
