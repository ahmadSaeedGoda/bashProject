#!/bin/bash
echo "enter dbName ";
	read dbName;
if [[ -d databases/$dbName ]]
	then
	echo "Enter table Name: ";
	read tblname;
	if [[ -f databases/$dbName/$tblname ]]
		then
 		echo "SORRY!";
		echo "$tblname already exists";
	else
	touch databases/$dbName/$tblname;
	echo "done!";
	fi
else
	echo "$dbName NOT FOUND";
fi