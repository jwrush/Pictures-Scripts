#!/bin/bash

#this script creates a copy ($3) of image $2, uniform scaled
#to fit inside the dimensions of $1.

#we want to rescale by the larger ratio between matching dimensions
#(i figured this out using algebra, don't have a good intuition about
#why it works)

a=$(identify -format '%w' $1)
b=$(identify -format '%h' $1)
x=$(identify -format '%w' $2)
y=$(identify -format '%h' $2)

echo "scale template: $1 is $a x $b"
echo "image to scale: $2 is $x x $y"
echo "output: $3"

#if we don't have to rescale, don't.
if (( 0 > $a-$x || 0 > $b-$y ))
then
	maxDimension=$(bc << EOF
scale=3
a=$a.000
b=$b.000
x=$x.000
y=$y.000
w_ratio = a / x
h_ratio = b / y
if (w_ratio > h_ratio) $a else $b
EOF
	)
	
	echo "resizing to a maximum dimension of $maxDimension"
	convert $2 -background black -scale $maxDimension -gravity center -extent ${a}x${b} $3
else
	echo "no resizing performed, second image already fits" 
	convert $2 -background black -gravity center -extent ${a}x${b} $3
fi
