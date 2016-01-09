#!/bin/bash
echo "enter dbName ";
	read dbName;

if [[ -d databases/$dbName ]]
	then
	echo "Enter table Name: ";
	read tblname;
	
	if [[ -f databases/$dbName/$tblname ]]
		then
		echo -e "" >>databases/$dbName/$tblname;
		awk '{if(NR==1)print $0}' databases/$dbName/$tblname;
		colnum=`awk -F: '{if(NR==1){print NF}}' databases/$dbName/$tblname`;
		let colnum-=1;
		for (( i = 1; i <= $colnum; i++ ))
		do
			echo "enter value no.$i: ";		
			read answer;
			var=`awk -F: -v"i=$i" '{if(NR==2)print $i}' databases/$dbName/$tblname`;
			
			while [[ $var -eq 1 && "$answer" != +([0-9]) ]]
			do
				echo "this field should be integers only";
				echo "enter value: ";
				read answer;
			done
			# echo -n "$answer:" >>databases/$dbName/$tblname;
			
			while [[ $var -ne 1 && "$answer" != +([a-zA-Z]) ]]
			do
				echo "this field should be string only";
				read answer;
			done
			echo -n "$answer:" >>databases/$dbName/$tblname;
		done

		# echo -n "$answer" >>databases/$dbName/$tblname;
		
		echo -e "" >>databases/$dbName/$tblname;
	else
	echo "$tblname NOT FOUND";
	fi

else
	echo "$dbName NOT FOUND";
fi