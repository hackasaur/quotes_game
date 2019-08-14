while true;
do
	echo "the available files are:"
	ls authors	
	echo "choose a file to read"
	read -p ">" f1
	f1="authors/"$f1
	cat "$f1"
	printf "\n\n"
done
