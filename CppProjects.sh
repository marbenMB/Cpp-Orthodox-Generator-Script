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
	std::cout << \"Default Constructor Called\" << std::endl;
}

$CLASS::~$CLASS()
{
	std::cout << \"Destructor Called\" << std::endl;
}

$CLASS::$CLASS($CLASS const &obj)
{
	std::cout << \"Copy Constructor Called\" << std::endl;
}

$CLASS	&$CLASS::operator= (const $CLASS &obj)
{
	std::cout << \"Copy Assignment Operator Called\" << std::endl;
	
	return (*this);
}\n" >> $CLASS.cpp

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
}\n" >> main.cpp

	echo "+> " $CLASS " : Files Created !"
else
	echo "No Class Name Entred"
fi