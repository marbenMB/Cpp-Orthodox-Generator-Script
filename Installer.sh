#!/bin/bash

#	***********************	#
#	Functions Definitions :
#	***********************	#

pulling () {
	loading &
	pid=$!
	git pull 1> /dev/null
	pullCheck
	kill $pid
	wait $pid 2>/dev/null
	echo ""
}

loading () {

	echo ""
	echo -n "	"
	while [ 1 ]
	do
		echo -ne "█"
		sleep 0.1
	done
}

pullCheck () {
	printf "\n\n"
	if [ $? == "0" ]
	then
		echo -e "		\x1b[32m ... Update DONE ... \033[m"
	else
		echo -e "		\x1b[31m ... Update FAILED ... \033[m"
	fi
}

#	***********************	#
#	Header Printing :
#	***********************	#

printf "\n"
printf "░█████╗░██████╗░██████╗░  ░██████╗░███████╗███╗░░██╗
██╔══██╗██╔══██╗██╔══██╗  ██╔════╝░██╔════╝████╗░██║
██║░░╚═╝██████╔╝██████╔╝  ██║░░██╗░█████╗░░██╔██╗██║
██║░░██╗██╔═══╝░██╔═══╝░  ██║░░╚██╗██╔══╝░░██║╚████║
╚█████╔╝██║░░░░░██║░░░░░  ╚██████╔╝███████╗██║░╚███║
░╚════╝░╚═╝░░░░░╚═╝░░░░░  ░╚═════╝░╚══════╝╚═╝░░╚══╝\033[m\n"

printf "\n                            By : \x1b[33mmarbenMB\033[m [mbenbajj]\n"
echo ""
echo "------------------------------------------------------"
printf "		Usage Command : \x1b[32mCppGen\033[m\n"
echo "------------------------------------------------------"

#	***********************	#
#	Command Installation :
#	***********************	#

echo ""
echo -e "		\x1b[32m ... Installation ... \033[m"
echo -e "		\x1b[33m ..... Updating ..... \033[m"

pulling

#	***********************	#
#	Command Existance :
#	***********************	#

cat ~/.zshrc | grep -c CppGen 1> /dev/null

if [ $? == "1" ]
then
	echo "alias CppGen='bash ~/MakeGit_Script/Cpp_OrthodoxGenerator.sh'" >> ~/.zshrc

	if [ $? == "0" ]
	then
		echo -e "		\x1b[32mInstallation DONE :D\033[m"
	else
		echo -e "		\x1b[31m  Installation FAILED \033[m"
	fi
else
	echo -e "		\x1b[33mAlready Installed :D \033[m"
fi
echo ""
