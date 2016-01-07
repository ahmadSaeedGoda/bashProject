#!/bin/bash
# mkdir with the name sent by user 
# first check if the directory exits or not
echo "Enter DB Name: ";
read dbname
if [[ -d databases/$dbname ]]
then
 	echo "SORRY!";
	echo "$dbname already exists";
else	
	mkdir databases/$dbname;
	echo "done!";
fi