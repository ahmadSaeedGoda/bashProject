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
		echo "done!"
		echo "enter number of columns: ";
		read columns;
	
		for (( i = 1; i <= $columns ; i++ ))
			do
			echo "enter name of column no. $i: ";
			read clmname;
			echo "$clmname  " >> databases/$dbName/$tblname;
			echo "enter type of column no. $i: (string,integer)";
			read typ;
			echo "$typ  " >> databases/$dbName/$tblname; 	
			done			
fi

else
	echo "$dbName NOT FOUND";
fi