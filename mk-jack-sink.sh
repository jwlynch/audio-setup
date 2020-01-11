#!/bin/bash

# creates a jack sink which connects to pulse, named by first arg
#
# SYNOPSIS
#
# mk-jack-sink <sink name>

right_args="f"

if [ "$#" == "0" ]
then
    echo "no args"
    right_args="f"
else
    if [ "$#" == "1" ]
    then
	right_args="t"
    else
	right_args="f"
    fi
fi

if [ "$right_args" == "f" ]
then
   echo "wrong number of args" 1>&2
   exit
fi

pactl load-module module-jack-sink client_name=pulse_sink_"$1" connect=no channels=2
