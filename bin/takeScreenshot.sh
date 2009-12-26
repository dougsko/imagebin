#!/usr/bin/env bash
#
# Take a screenshot, upload it, and display the link
#
# Requires: imagemagick, xmessage, and the imagebin script
#

# Location to save files
WORKINGDIR=/tmp
# Default delay before taking screenshots
DELAY=3
#Prefix to use for images captured. 
PREFIX=screenshot
IMPORT=`which import`

# Check if the dir to store the screenshots exists, else create it: 
if [ ! -d "${WORKINGDIR}" ]; then mkdir "${WORKINGDIR}"; fi 

i=`ls -l $WORKINGDIR/$PREFIX*.png | wc -l` 
((i = i+1))

sleep $DELAY
$IMPORT -window root $WORKINGDIR/$PREFIX-$i.png
xmessage -nearmouse `imagebin -p -l -f $WORKINGDIR/$PREFIX-$i.png`
rm $WORKINGDIR/$PREFIX-$i.png
