#!/usr/bin/env bash

# Location to save files
WORKINGDIR=$HOME/screenshots
# Default delay before taking screenshots
DELAY=3
#Prefix to use for images captured. 
PREFIX=screenshot

# Check if the dir to store the screenshots exists, else create it: 
if [ ! -d "${WORKINGDIR}" ]; then mkdir "${WORKINGDIR}"; fi 

i=`ls -l $WORKINGDIR/$PREFIX*.png | wc -l` 
((i = i+1))

sleep $DELAY
import -window root $WORKINGDIR/$PREFIX-$i.png
zenity --info --text=`imagebin -p -f $WORKINGDIR/$PREFIX-$i.png`
