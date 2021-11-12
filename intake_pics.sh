#!/bin/sh

INDIR="/home/rush/Pictures/in"

#takes one param, the file pattern to intake
_intake () {
  if [ "$PWD" != $INDIR ]; then
    echo "Emptying $1 from $PWD to $INDIR ..."
    mv $PWD/$1 $INDIR/
  fi

  echo "Moving $1 from Downloads to $PWD ..."

  NUM_MOVED=$(mv -v ~/Downloads/$1 ./ | wc -l)

  echo "... $NUM_MOVED moved."
}

_intake "*.jpg"
_intake "*.jpeg"
_intake "*.bmp"
_intake "*.png"
