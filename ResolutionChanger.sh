#!/bin/bash

size()
{
  read -p "HORZO?
" HORZO

  read -p "VERT?
" VERT

  
 echo "$HORZO x $VERT" 

 read -p "Is this the correct resolution? [Y/N]?
" ANS

 
 if [ "$ANS" == "N" ]; 
  then
   size

  else
  CVT=$(cvt $HORZO $VERT | grep -o "\".*$")
 
  fi 
}

size

xrandr --newmode $CVT

CVT=$(echo $CVT | awk '{print $1}') 

xrandr --addmode "Virtual1" $CVT 

xrandr -s $HORZO"x"$VERT
