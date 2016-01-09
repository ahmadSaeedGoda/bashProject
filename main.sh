#!/bin/bash
select myvar in createDB renameDB dropDB createTable droptbl renametbl showDatabases showTables addrow selection
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
		addrow )
			bash addrow.sh $columns
			;;
		selection )
			bash selection.sh
			;;
		* ) echo "what is $REPLY!"
			echo "pls select one to continue."
			bash main1.sh
			;;
	esac

done