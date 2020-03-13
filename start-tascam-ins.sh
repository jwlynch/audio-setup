#! /bin/bash

alsa_in -d hw:CARD=US4x4,DEV=0 -j "tascam ins" -c 4 &

