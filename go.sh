#!/bin/bash

if [[ "$1" == "-t" ]] || [[ "$1" == "--test" ]]
then 
	ruby ruby/tc_alphabet_pyramid.rb
	exit
else if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] 
	then
		echo 'usage: ./go.sh [<alphabet>] [-t|--test]'
		echo 'OPTIONS'
		echo '       ./go.sh'
		echo '                The program will ask the user for a new input' 
		echo '       ./go.sh <alphabet>'
		echo '                Input a character [a-zA-z] as a parameter'
		echo '       ./go.sh -h, --help'
		echo '                Print the help text'
		echo '       ./go.sh -t, --test'
		echo '                Run the unit test cases'
		exit
	else 
		ruby ruby/main.rb $1
	fi
fi
