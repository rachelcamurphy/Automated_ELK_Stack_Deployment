#!bin/sh
#Rachel Murphy
#Week 3 Homework: A High Stakes Investigation
#Bonus Script
#Directions for the terminal
#sh roulette_dealer_finder_by_time_and_game.sh <date> <time> <specific game column numbers>
#Columns $3 and $4 return the BlackJack Dealer
#Columns $5 and $6 return the Roulette Dealer
#Columns $7 and $8 return the Texas Hold Em' Dealer
 
cat DEALER_SCHEDULE | awk -F" " '{print $1, $2, '$3', '$4'}' | grep "$2" 
