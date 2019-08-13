#!/bin/bash
clear
#title art
file1="./art/titleart"
while IFS= read -r line
do
	echo "$line"
done <"$file1"

sleep 1
printf "\n\n"

while true; do

#to select the file name to fetch quotes from
echo "list of available authors:"
ls authors

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
	echo '"'${quotes[i]}'"'
	read -s -p "remember the quote and press enter"
	clear
	echo "what was the quote?"
	read string
	if [ "$string" == "${quotes[i]}" ]
	then
		echo "correct!"
	else 
		echo "wrong!"
		echo "correct answer is: ${quotes[i]}"
	fi
	read -p "press enter"
	clear
done

done

