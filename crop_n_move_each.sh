#!/bin/bash
#usage crop_n_move_each DIR PREFIX
#gives the ability to make a crop of every picture in a directory, for manual
#object recoginition

DIR_ESCAPED_FOR_SED=$(echo $1 | sed -e 's/[\/&]/\\&/g')
PRE_ESCAPED_FOR_SED=$(echo $2 | sed -e 's/[\/&]/\\&/g')

#SED_PROGRAM=$(echo 's/^.*\/([^\/]+)$/piccrop.sh "\0" '"$1\/$2/")
SED_PROGRAM=$(echo 's/^.*$/piccrop.sh "\0" "'"$DIR_ESCAPED_FOR_SED\/$PRE_ESCAPED_FOR_SED.\0"'"/')

ls -p | grep -E "jpe?g$|png$" | sed -E "$SED_PROGRAM"

#source <(ls -p | grep -E "jpe?g$|png$" | sed 's_^(.)*$_piccrop.sh "\0" $1/$2_')
