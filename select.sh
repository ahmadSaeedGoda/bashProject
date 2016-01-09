#!/bin/bash
awk '{if(NR!=0&&NR!=1)print $input}' 
echo "enter dbName ";
	read dbName;

if [[ -d databases/$dbName ]]
	then
	echo "Enter table Name: ";
	read tblname;
	
	if [[ -f databases/$dbName/$tblname ]]
		then
		echo "enter values to select: " 
		awk '{if(NR==1)print $0}' databases/$dbName/$tblname;
		read answer;
		awk -F: '{for(i=1;i<=NF;i++){if($answer==$i)print $i}}' databases/$dbName/$tblname;
		echo -n "$answer" >>databases/$dbName/$tblname;
		
	else
	echo "$tblname NOT FOUND";
	fi

else
	echo "$dbName NOT FOUND";
fi