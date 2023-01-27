#!/bin/bash

#check if arguments passed or not
if [[ $# -ne 2 ]]
then
echo -e "please enter two directories as arguments to get unique files from both:\nusage: $0 dir1 dir2"
exit
fi
# files present in both dir and dir 2
echo -e  "files present in both $1 and $2:\n$(ls -p  $1 | grep -v /)\n$(ls -p  $2  |grep -v /)\n"
#files present in dir1 and not in dir2
 echo -e "files present in $1 and not in $2:"
for dir1 in $(find $1 -maxdepth 1 -type f)
do
for dir2 in $(find $2 -maxdepth 1 -type f)
do 
    df1=$(md5sum $dir1 | awk '{print $1}' )
    df2=$(md5sum $dir2 | awk '{print $1}' )
    
if [ $df1 == $df2 ]
 then
  break
 fi
 done
if [ $df1 != $df2 ]
 then
file_name=$(basename $dir1)
echo -e "$file_name"
 fi
done

echo -e "\n"

#files present in dir2 and not in dir1
echo -e "files present in $2 and not in $1:"
for dir2 in $(find $2 -maxdepth 1 -type f)
 do
for dir1 in $(find $1 -maxdepth 1 -type f)
 do 
    df1=$(md5sum $dir2 | awk '{print $1}')
    df2=$(md5sum $dir1 | awk '{print $1}')
    
if [ $df1 == $df2 ]
 then
  break
fi
 done
if [ $df1 != $df2 ]
 then
file_name=$(basename $dir2)
echo -e "$file_name"
 fi

 done






