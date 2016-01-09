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
		export columns;
		for (( i = 1; i <= $columns ; i++ ))
		do
			echo "enter name of column no.$i: ";
			read clmname;
		 		echo -n "$clmname:" >>databases/$dbName/$tblname;
		done
		echo -e "" >>databases/$dbName/$tblname;
		for (( i = 1; i <= $columns; i++ ))
		do
			echo "enter type of column no.$i: ";
			for (( i = 1; i <= $columns; i++ ))
			do
				select typ in integer string
				do
					case $typ in
						1 )
						echo -n "1:" >>databases/$dbName/$tblname;
							break
							;;
						2 )
						echo -n "2:" >>databases/$dbName/$tblname;
							break
							;;
						* )
						echo "INVALID OPTION!"
							
							;;
					esac
				done
			done
		done

		echo -e "" >>databases/$dbName/$tblname;		
fi

else
	echo "$dbName NOT FOUND";
fi