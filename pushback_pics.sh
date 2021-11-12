#!/bin/sh
TAG=$(date +"%Y%m%d_%H%M")
mkdir $TAG
find -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg"  \) -exec echo $TAG/{} \; -exec mv {} ./$TAG/{} \;
