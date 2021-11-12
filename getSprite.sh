#!/bin/sh
#usage getSprint.sh imagefile spriteX spriteY numberX numberY outfile

convert $1 -crop $2'x'$3'+'$(( $2*$4 ))'+'$(( $3*$5 )) +repage $6
