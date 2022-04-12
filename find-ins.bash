#!/bin/bash

#for i in $(aplay -L | grep "^[^\ ]")
#do
#    echo test device is $i
#    speaker-test -t wav -c 2 -l 1 -D $i
#    echo "more?"
#    #read ans
#    #if [ "$ans" = "n" ]
#    #then
#	#exit
#    #fi
#done

# gnarface said: arecord -D [device] -V

arecord -L | grep "^[^\ ]"
