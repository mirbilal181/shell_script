#!/bin/bash
if [[ $# -ne 1 ]]
then
echo -e "please enter a directory  as arguments to get duplicate files under nested directories:\nusage: $0 dir1"
exit
fi

dir=$1
#printing  files having duplicates under nested directories
echo -e "files having duplicates under nested directories:\n"
for dir1 in $(find $dir  -maxdepth 1 -type f)
do

for subdir in $(find $dir  -mindepth 2 -type f)
do 
     df=$(md5sum $dir1  | awk '{print $1}')
    sf=$(md5sum $subdir | awk '{print $1}')
    
if [ $df == $sf ]
then
#print file names which have duplicates under nested directories.
file_name=$(basename $dir1)
 echo "$file_name"
break
fi

#if we want to print file names of nested directories which have duplictes in parent directory.

#if [ $df == $sf ]
#then 
#file_name=$(basename $subdir)
#echo "$file_name"
#fi
 
 done

done











