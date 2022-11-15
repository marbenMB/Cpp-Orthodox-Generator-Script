#!/bin/bash

PATH=""
CLASS=""

/usr/bin/clear

#PATH
echo -n "Enter Path Of Creation : "
read PATH

if [ -d $PATH ]
then 
	cd $PATH
	echo $PATH
	else
		echo "***" $PATH  " : ** not found !! **"
fi

echo -n "Enter Class Name : "
read CLASS
if [ $CLASS != "" ]
then
	/usr/bin/touch main.cpp Makefile $CLASS.cpp $CLASS.hpp
	echo "+> " $CLASS " : Files Created !"
else
	echo "No Class Name Entred"
fi