#!/bin/bash

errors=""
while IFS= read -r line
do
	echo "${line}"
	if [[ ("$line" != "----"*) && ("$line" != "Creating manpage"*) ]]
	then
		errors="${errors}${line}"'\n'
	fi
done

if [ -n "$errors" ]
then
	echo "======================"
	echo "Manpage build failure:"
	echo "======================"
	echo -e $errors
	exit 1
else
	echo "Outputcheck: No errors while building manpages."
fi

