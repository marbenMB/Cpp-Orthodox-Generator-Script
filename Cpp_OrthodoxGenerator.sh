#!/bin/bash

git pull 1> /dev/null
clear

printf "\n"
printf "░█████╗░██████╗░██████╗░  ░██████╗░███████╗███╗░░██╗
██╔══██╗██╔══██╗██╔══██╗  ██╔════╝░██╔════╝████╗░██║
██║░░╚═╝██████╔╝██████╔╝  ██║░░██╗░█████╗░░██╔██╗██║
██║░░██╗██╔═══╝░██╔═══╝░  ██║░░╚██╗██╔══╝░░██║╚████║
╚█████╔╝██║░░░░░██║░░░░░  ╚██████╔╝███████╗██║░╚███║
░╚════╝░╚═╝░░░░░╚═╝░░░░░  ░╚═════╝░╚══════╝╚═╝░░╚══╝\033[m\n"

printf "\n                            By : \x1b[33mmarbenMB\033[m [mbenbajj]\n"
echo ""

echo -n "Current Directory : "
pwd

#Variables
PATH=""
CLASS=""
OPTION=""

#PATH
echo "*******************************************************"
echo -ne "\x1b[33mEnter Path Of Creation : \033[m"
read PATH

if [ -d $PATH ]
then 
	cd $PATH
	echo "Changing Directory to : " $PATH
	echo "*******************************************************"
	echo -ne "\x1b[33mEnter Class Name : \033[m"
	read CLASS
	if [ $CLASS != "" ] 2> /dev/null
	then
		echo "Class Name : " $CLASS
		echo "*******************************************************"
		/usr/bin/touch $CLASS.cpp $CLASS.hpp 

		#	***		Printing To Class.hpp	***

		echo "#ifndef _"$CLASS"_HPP_" >> $CLASS.hpp
		echo "#define _"$CLASS"_HPP_" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp
		echo "#include <iostream>" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp

		echo "// ******************************************************** //" >> $CLASS.hpp
		echo "//                         CLASSES                         //" >> $CLASS.hpp
		echo "// ****************************************************** //" >> $CLASS.hpp

		printf "\nclass	$CLASS
{
	public	:
		$CLASS ();
		$CLASS ($CLASS const &obj);
		~$CLASS ();
		$CLASS &operator= (const $CLASS &obj);

	private	:
		//	private attributes.
};\n\n" >> $CLASS.hpp

		printf "// ******************************************************** //
//                        FUNCTIONS                        //
// ****************************************************** //\n\n" >> $CLASS.hpp

		echo "#endif" >> $CLASS.hpp

		#	***		Printing To Class.cpp	***

		printf "#include \"$CLASS.hpp\"

$CLASS::$CLASS()
{
	std::cout << \"$CLASS : Default Constructor Called\" << std::endl;
}

$CLASS::~$CLASS()
{
	std::cout << \"$CLASS : Destructor Called\" << std::endl;
}

$CLASS::$CLASS($CLASS const &obj)
{
	std::cout << \"Copy Constructor Called\" << std::endl;
	if (this != &obj)
		*this = obj;
}

$CLASS	&$CLASS::operator= (const $CLASS &obj)
{
	std::cout << \"Copy Assignment Operator Called\" << std::endl;
	if (this != &obj)
	{
		// ...
	}
	return (*this);
}\n" > $CLASS.cpp

	echo -ne "\x1b[33mCreate main.cpp and Makefile \033[m[\x1b[32my\033[m/\x1b[31mn\033[m] : "
	read OPTION
	if [ $OPTION == "y" ] || [ $OPTION == "yes" ]
	then
		/usr/bin/touch main.cpp Makefile
		#	***		Printing To Makefile	***

			printf "NAME = $CLASS \n
CXXFLAGS = -Wall -Wextra -Werror \n
CC = c++ \n
STD = -std=c++98 \n
SRC = $CLASS.cpp main.cpp \n
INC = $CLASS.hpp \n
OBJ = \$(SRC:.cpp=.o) \n
all : \$(NAME) \n
\$(NAME) : \$(OBJ)
	\$(CC) \$(CXXFLAGS) \$(STD) \$(OBJ) -o \$(NAME) \n\n" >> Makefile

		echo %.o : %.cpp "\$(INC)" >> Makefile
		printf "	\$(CC) \$(CXXFLAGS) -c \$< -o \$@ \n
clean :
	rm -rf \$(OBJ) \n
fclean : clean
	rm -rf \$(NAME) \n
re : fclean all \n
.PHONY : all clean fclean re\n" >> Makefile

			#	***		Printing To main.cpp	***

			printf "#include \"$CLASS.hpp\"\n
int main()
{
	//	You Code\n
	std::cout << \"******	MAR_BEN CREATION √	******\" << std::endl;\n
	return (0);
}\n" > main.cpp
	fi
		printf "\n░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
█████╗█████╗█████╗█████╗█████╗█████╗█████╗
╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\n\n"
		echo -e "\x1b[32m+> " $CLASS " : Files Created !\033[m\n"
	else
		echo -e "______________________________________\n"
		echo -e "\x1b[31mNo Class Name Entred\033[m\n"
	fi
	else
		echo -e "______________________________________\n"
		echo -e "\x1b[31m*** $PATH : ** Path not found !! **\033[m\n"
fi
