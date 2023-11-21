#!/bin/bash

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')

TH=1024

if [[ $FREE_SPACE -lt $TH ]]
then
	echo "WARNING!!!!! RAM is running low"
else
	echo "RAM space is sufficient- $FREE_SPACE MiB"
fi

