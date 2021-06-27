#!/bin/bash

size()
{
  read -p "HORZO?
" HORZO

  read -p "VERT?
" VERT

  
 echo "$HORZO x $VERT" 

 read -p "Correct? [Y/N]?
" ANS

 
 if [ "$ANS" == "N" ]; 
  then
   size

  else
  CVT=$(cvt $HORZO $VERT | grep -o "\".*$")
 #CVT=$(cvt 1600 900 | awk 'FNR==2 {for(i=2;i<=NF;i++){printf "%s ", $i}}')
  fi 
}

size

xrandr --newmode $CVT

CVT=$(echo $CVT | awk '{print $1}') 

xrandr --addmode "Virtual1" $CVT 

xrandr -s $HORZO"x"$VERT
