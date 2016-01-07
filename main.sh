#!/bin/bash
select myvar in createDB renameDB dropDB createTable droptbl renametbl showDatabases showTables
do
	case $myvar in
		createDB )	
			bash createdb.sh $dbname
			;;
		renameDB )
			bash renamedb.sh
			;;
		dropDB )  
			bash dropdb.sh
			;;
		createTable )  
			bash createtbl.sh $tblname
			;;
		droptbl )
			bash droptbl.sh
			;;
		renametbl )
			bash renametbl.sh
			;;
		showDatabases )
			bash showDatabases.sh
			;;
		showTables )
			bash showTables.sh
			;;
		* ) echo "what is $REPLY!"
			echo "pls select one of the above to continue."
			;;
	esac

done