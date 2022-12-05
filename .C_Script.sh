#!/bin/bash

TYPE=""
ADD=""
DIR=""
EXEC=""

clear

# Src Dir
echo -n "Enter your Directory path : "
read DIR
cd $DIR
echo -n "CD to -> "
echo $DIR
echo "-------------------------"
echo -n "Enter Executable name : "
read EXEC
echo "-------------------------"

# Type execution
echo "+> (m) : make | (git) : git <+"
echo -n "	--> "
read TYPE

echo "-------------------------"
if [ $TYPE = "m" ]
then
	echo "	Making		"
fi
if [ $TYPE = "git" ]
then
	echo "	git status		"
fi
echo "-------------------------"

# making
if [ $TYPE = "m" ]
then
	make && ./$EXEC
	#make re && ./cub3d maps/map ; make fclean 
else
	# git options 
	if [ $TYPE = "git" ]
	then
		git status
		echo -------------------------
		echo "(rm) : Delete files | (. | -u | f_name) | n : exit"
		echo -n "	--> "
		read ADD
		if [ $ADD = "n" ]
		then
			exit 1
		fi
		if [ $ADD = "rm" ]
		then
			echo "/!\ Which files would you delete: "
			echo -n "	--> "
			read ADD
			rm -rf $ADD
			echo "/!\ $ADD Deleted"
			echo "-------------------------"
		else
			git add $ADD
			echo "Files tracked √"
			echo "-------------------------"
			echo "Your commit :"
			echo -n "	--> "
			read ADD
			git commit -m "$ADD"
			echo "Changes Commited √"
			echo "-------------------------"
			echo -n "/!\ Validation : (ok) : push -->  "
			read ADD
			if [ $ADD = "ok" ]
			then
				git push
				echo "Commit Pushed √"
				echo "-------------------------"
				exit 0
			else
				echo "/!\ Commit Not Pushed "
				exit 1
			fi
		fi
	fi
fi
