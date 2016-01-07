#!/bin/bash
echo "enter dbName name: ";
read dbname;
if [[ -d databases/$dbname ]];
then
	echo "enter table name to drop";
	read tblname;
	if [[ -f databases/$dbname/$tblname ]];
	then
		rm databases/$dbname/$tblname;
		echo "done!";
	else
		echo "NOT FOUND";
	fi
else
	echo "db NOT FOUND";
fi