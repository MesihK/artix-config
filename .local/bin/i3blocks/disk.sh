#!/bin/sh

echo '<span color="#9f78e1">:/</span>'$(df /dev/sda5 -h | tail -n 1 | tr -s ' ' | cut -d ' ' -f 4) 
