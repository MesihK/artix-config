#!/bin/sh
#diyanet siteyi degistirmis bugunu tabloda vermiyor daha ustte veriyor. Scriptin duzeltimesi gerek

#gebze
#http://namazvakitleri.diyanet.gov.tr/tr-TR/9651/
#http://namazvakitleri.diyanet.gov.tr/en-US/9651/

LABEL='<span color="#55aa55">''</span>'

minutes () {
    HOUR=$(echo $1 | cut -c -2)
    MIN=$(echo $1 | cut -c 4-)
    echo $(echo $HOUR\*60\+$MIN | bc)
}

todate () {
    HOUR=$(echo $1\/60 | bc)
    MIN=$(echo $1\-$HOUR\*60 | bc)
    echo $HOUR:$MIN
}

printname () {
    if [ $1 = "1" ]; then
        echo "Imsak"
    elif [ $1 = "2" ]; then
        echo "Güneş"
    elif [ $1 = "3" ]; then
        echo "Öğle"
    elif [ $1 = "4" ]; then
        echo "İkindi"
    elif [ $1 = "5" ]; then
        echo "Akşam"
    else
        echo "Yatsı"
    fi
}

LOCATION=8777
#ames=8777
#gebze=9651
#avanos=17878
#chicago=8760
#LOCATION=17878
DATE="$(date +%d.%m.%Y)"
TOMORROW=$(date -d tomorrow +%d.%m.%Y)
FILE=~/.local/bin/i3blocks/$LOCATION.dat
TIME=$(minutes $(date +%H:%M))

if [ ! -f $FILE ] 
then
    wget http://namazvakitleri.diyanet.gov.tr/en-US/$LOCATION -O $FILE
fi

case $BLOCK_BUTTON in
	3)
	STR=" $DATE \n"
	CNT=0
	cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+ | while read -r line ; do
		CNT=$(echo $CNT\+1 | bc)
		STR="${STR}$(printname $CNT)\t$line \n"
		#since this is subshell, we need to notify-send here
		echo $STR
		if [ $CNT -eq 6 ]
		then
			notify-send "  Namaz Vakitleri" "$STR"
		fi
	done
	;;
esac

#cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+  > /tmp/namaz.dat
cat $FILE | grep -m1 -A 6 $TOMORROW > /dev/null 
if [ $? -eq 1 ]
then
    #echo data is old!
    wget http://namazvakitleri.diyanet.gov.tr/en-US/$LOCATION -O $FILE
    exit 0
fi
CNT=0
cat $FILE | grep -m1 -A 6 $DATE | grep -oP [0-9]+:[0-9]+ | while read -r line ; do
    CNT=$(echo $CNT\+1 | bc)
    Tline=$(minutes $line)
    if [ $(minutes $line) -gt $TIME ]
    then
        RES=$(echo $Tline \- $TIME | bc)
        
        echo $LABEL $(printname $CNT) $(todate $RES)
        exit 0
    fi
done

#couldn't find right prayer time
CNT=1
DATE=$(date -d tomorrow +%d.%m.%Y)
#get first time
Tline=$(minutes $(cat $FILE | grep -m1 -A 1 $DATE | grep -oP [0-9]+:[0-9]+))
RES=$(echo 24\*60\-$TIME\+$Tline | bc)
echo $LABEL $(printname $CNT) $(todate $RES)


