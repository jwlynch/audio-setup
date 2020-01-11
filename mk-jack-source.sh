#!/bin/bash

# creates a jack source which connects to pulse, named by first arg
#
# SYNOPSIS
#
# mk-jack-source <source name>

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

pactl load-module module-jack-source client_name=pulse_source_"$1" connect=no channels=2
