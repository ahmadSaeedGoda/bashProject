#!/bin/bash
echo "enter dbname to drop";
read drop;
if [[ -d databases/$drop ]]
then
	rm -r databases/$drop;
	echo "done!";
else	
	echo "$drop NOT FOUND";
fi
#select myvar in `ls data`
#do
#	case $myvar in `ls data` 
#		
#		$myvar )  rm -r data/$myvar/$1
#			;;
#		* ) echo "what is $REPLY!"
#			echo "NOT FOUND DB"
#			echo "check spelling and try again."
#			;;
#	esac
#
#done