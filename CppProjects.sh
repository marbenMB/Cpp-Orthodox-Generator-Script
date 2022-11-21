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
	echo "#endif" >> $CLASS.hpp
	echo "+> " $CLASS " : Files Created !"
else
	echo "No Class Name Entred"
fi