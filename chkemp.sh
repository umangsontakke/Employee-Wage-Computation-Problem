#!/bin/bash -x

isPresent=1
randomCheck=$((RANDOM%2));

if [ $isPresent -eq  $randomCheck ];
then
	echo "Emmployee is present";
else 
	echo "employee is Absent";
fi
