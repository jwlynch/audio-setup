#!/bin/bash

# creates a jack sink which connects to pulse, named by first arg                                                               
#
# SYNOPSIS
#
# mk-alsa-sink <sink name> [ <devicename> ]

right_args="f"

if [ "$#" == "0" ]
then
    right_args="f"
else
    if [ "$#" -ge "1" ] && [ "$#" -lt "3" ]
    then
	right_args="t"
	cl_name=$1

	if [ "$#" == "2" ]
	then
	    dev=$2
	    right_args="t"
	fi
    else
	right_args="f"
    fi
fi

if [ "$right_args" == "f" ]
then
   echo "wrong number of args ($#)" 1>&2
   exit
fi

if [ -n "$cl_name" ]
then
    echo "cl_name is $cl_name"
fi

if [ -n "$dev" ]
then
    echo "dev is $dev"
fi

if [ -z "$dev" ]
then
    pactl load-module module-alsa-sink client_name=alsa_sink_"$cl_name" connect=no channels=2
else
    pactl load-module module-alsa-sink client_name=alsa_sink_"$cl_name" connect=no channels=2 device="$dev"
fi
