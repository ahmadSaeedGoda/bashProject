#!/bin/bash
echo "pls enter dbName: ";
read dbname;
if [[ -d databases/$dbname ]]
then
	echo "enter table name: ";
	read tblname;
	if [[ -f databases/$dbname/$tblname ]];
	then
	 	echo "enter new name: ";
	 	read answer;
 		mv databases/$dbname/$tblname databases/$dbname/$answer;
 	echo "done!";
	else	
	echo "NOT FOUND";
	fi
else
	echo "$dbname NOT FOUND";
fi