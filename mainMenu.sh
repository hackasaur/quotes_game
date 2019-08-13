printf "1.play\n"
printf "2.library\n"
printf "3.settings\n"
printf "4.exit\n"
while true; do
	read -p "> " option
	case $option in 
		1 ) ./game.sh
		exit;;

		2 ) ./library.sh
		exit;;
		3 ) echo "not ready yet.";;

		4 ) exit;;
	
		* ) echo "choose from 1234";;
	esac
done

exit
