#!/bin/bash

#version 1
#date- 19 Nov 2023


#variables
BASE=/home/yuvraj/data
DAYS=10
DEPTH=1
RUN=0


#check whether the directory is present or not
if [ ! -d $BASE ]
then
	echo "directory does not exist- $BASE"
	exit 1

fi


#create an "archive" folder if not present
if [ ! -d $BASE/archive ]
then
	mkdir $BASE/archive
fi


#find the list of files larger than 20mb

for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do
	if [ $RUN -eq 0 ]
	then
		echo "$date archiving $i ==> $BASE/archive"
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done



















