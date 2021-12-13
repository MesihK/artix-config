#!/bin/sh

C='<span color="#FFB52A">°C</span>'
#echo $(sensors | grep junction | tr -s ' ' | cut -d ' ' -f 2 | cut -c 2-5)$C
echo $(acpi -t | cut -d ' ' -f 4)$C
