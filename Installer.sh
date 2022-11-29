#!/bin/bash
echo ""
echo "-------------------------------------------------------------"
echo "		 ******"
echo -e "\x1b[32m+> Usage : use > CppGen < command to run script anywhere!!\033[m"
echo "		 ******"
echo "-------------------------------------------------------------"
echo ""
echo -e "\x1b[32m ... Installation ... \033[m"
echo -e "\x1b[33m ..... Updating ..... \033[m"
git pull

if [ $? == "0" ]
then
	echo -e "\x1b[32m ... Update DONE ... \033[m"
else
	echo -e "\x1b[31m ... Update FAILED ... \033[m"
fi

echo "alias CppGen='bash ~/MakeGit_Script/CppProjects.sh'" >> ~/.zshrc
if [ $? == "0" ]
then
	echo -e "\x1b[32m ... Installation DONE ... \033[m"
else
	echo -e "\x1b[31m ... Installation FAILED ... \033[m"
fi