#!/bin/bash

#checking for arguments
if [[ $# -ne 2 ]]
then
echo -e "please enter two files as arguments to get diffrence in lines from both:\nusage: $0 file1 file2"
exit
fi

file_1_content=$(cat $1)
file_2_content=$(cat $2)

# displays lines in both files
echo -e "lines present in both $1 and $2:\n$file_1_content\n$file_2_content\n"

#displays lines  only in file1
file_1=$(diff $1 $2| grep "<" |sed -e 's/< //' )
echo -e "lines present in $1 and not in $2:\n$file_1\n"
#diplays lines only in file2
file_2=$(diff $1 $2| grep ">" |sed -e 's/> //')
echo "lines present in $2 and not in $1:\n$file_2"
