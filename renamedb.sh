#!/bin/bash
#show dbnames exist to let user choose one
echo "pls enter dbName to change :";
read chge;
	if [[ -d databases/$chge ]]
	then
 	echo "enter new name";
 	read answer;
 	mv databases/$chge databases/$answer;
 	echo "done!";
	else	
	echo "NOT FOUND";
fi
#			for $chge in `ls data`; do
#				 	if [[ mv data/$chge/$1; ]]; then
#				 		#statements
#				 	fi
#				done
#				    
#					echo "what is $REPLY!";
#					echo "NOT FOUND DB";
#					echo "check spelling and try again."
#
#case $myvar in
#		$myvar )  mv data/$myvar/$1;
#				
#			;;
#		* ) echo "what is $REPLY!";
#			echo "NOT FOUND DB";
#			echo "check spelling and try again."
#			;;
#
#	if [[ $chge ==  ]]; then
#		#statements
#	fi
#
##	select myvar in `ls data `
##	do
##	case $myvar in
##		$myvar )  mv data/$myvar/$1;
#				
#			;;
#		* ) echo "what is $REPLY!";
#			echo "NOT FOUND DB";
#			echo "check spelling and try again."
#			;;
#	esac
#
#done