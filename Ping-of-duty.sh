##while true; do
##    ./bzping.sh
#    sleep 30
##    for i in {30..01}; do
##        sleep 1
##        printf "\r $WHITE Volgende scan in$ORANGE T$WHITE-minus: $ORANGE $i $WHITEsec"
##        done
##    clear
#done    
########

#!/bin/bash
#####
#
#           Ping-of-Duty
#            -----------
#####
dt=$(date '+%d/%m/%Y %H:%M:%S');
#echo "$dt"

#######
## COLOR / UI
#######
BLACK=$(tput setaf 000);
RED=$(tput setaf 001);
GREEN=$(tput setaf 002);
YELLOW=$(tput setaf 003);
BLUE=$(tput setaf 004);
MAGENTA=$(tput setaf 005);
CYAN=$(tput setaf 006);
WHITE=$(tput setaf 007);
ORANGE=$(tput setaf 202);
PINK=$(tput setaf 009);
bold=$(tput bold)
NORMAL=$(tput sgr0)
BAR=$(tput setaf 003);










echo " ";
echo "$WHITE   druk op $ORANGE CTRL+C$WHITE om te stoppen  $NORMAL" 
echo "$WHITE    iedere 30sec. WAN controle  $NORMAL" 
echo "$ORANGE ═════════════════════════════════════ $NORMAL ";
echo "$GREEN                  $WHITE$dt$GREEN ";
echo "$ORANGE LOCATIE        IP             STATUS $NORMAL ";

# Lees ips-bz.txt uit met indeling IP en HOSTNAME
# kolom 1 is ip > $i
# kolom 2 is hostname > $h
# Voer ping uit, strip output

while IFS='     '  read -r i h; do
    #echo "Lokatie: $h - IP $i" | 
    ping -c 2 "$i" > /dev/null
#    ping -c 1 "$i" > /dev/null
    if [ $? -eq 0 ]; then
    echo "$GREEN $h$YELLOW      $i       ✅ " 
    else
    echo "$RED $h$YELLOW        $i       🆘 "
    notify-send -a "🚨🚨🚨 Lokatie: $h 🚨🚨🚨" "🚧  $h  🚧"
    echo "$dt - lokatie: $h" >> bz_ping.log
    fi
done < bz_menu_IPS.txt
