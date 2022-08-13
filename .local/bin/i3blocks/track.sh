#!/bin/sh

TASKS='Class,Lab,Writing,LitReview,RCoding,Research'
CSV='/home/mesih/edu/tracker/tracker.csv'
WEEK=$(date +%W)
PWEEK=$(echo "$(date +%W)-1" | bc -l)
T=~/edu/tracker/track.py
#full performance if worked 4:00h=240m in a working day
FULL=240

case $BLOCK_BUTTON in
	1) notify-send 'Track Report' "$(date +%D)
$($T -c $CSV -iv)" ;;
	3) notify-send 'Track Report' "$(date +%D)
$TASKS 
$($T -c $CSV -w $WEEK -t $TASKS -f $FULL)" ;;
esac


if [[ $(date +%u) -gt 5 ]]; then
	echo $($T -c $CSV -q -S $signal)
else
	INFO=$($T -c $CSV -i -t $TASKS -f $FULL | cut -d ' ' -f2)
	echo $($T -c $CSV -q -S $signal) "<span color='#e60053'>$INFO</span>"
fi
