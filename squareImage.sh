#!/bin/bash

#usage squareImage.sh inimage outimage
#resizes an image to a square size of it's longest dimension

w=$(identify -ping -format "%w\n" $1)
h=$(identify -ping -format "%h\n" $1)

maxd=$(($h>$w?$h:$w))

convert $1 -background darkgray -gravity center  -extent ${maxd}x${maxd} $2
