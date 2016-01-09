#!/bin/bash
echo "enter db name: ";
read dbname;
if [[ -d databases/$dbname ]]; then
	ls databases/$dbname;
else
	echo "NO such database exist on system";
fi
