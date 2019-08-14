#!/bin/bash
clear

#colors
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

#title art
file1="./art/titleart"
while IFS= read -r line
do
	echo "$line"
done <"$file1"

sleep 1
printf "\n\n"

score=0
#body of the game starts here:
while true; do

#to select the file name to fetch quotes from
echo "list of available authors:"
ls -a authors

echo choose an author:
read file
file="authors/"$file
echo $file

#store lines in array named quotes[] read from $file
n=0
while read line; do
#	echo "$n: $line"
	quotes[$n]=$line
	n=$((n+1))
	done < $file 

printf "\n\n"

#quiz to test if player remembers each quote one by one
for (( i=0; i<n; i++));
do	
	echo "Score:$score"
	echo '"'${quotes[i]}'"'
	read -s -p "remember the quote and press enter"
	clear
	echo "what was the quote?"
	read string
	if [ "$string" == "${quotes[i]}" ]
	then
		echo -e "${GREEN}correct!${RESET}"
		((score++))
	else 
		echo -e "${RED}wrong!${RESET}"
		echo "correct answer is: ${quotes[i]}"
	fi
	read -p "press enter"
	clear
done
echo "your score is:$score"

done

