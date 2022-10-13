#!/bin/bash

INTERFACE=$1


echo "======== Before delay is removed ========"
tc qdisc show dev $INTERFACE


tc qdisc del dev $INTERFACE root netem


echo "======== After delay is removed ========"
tc qdisc show dev $INTERFACE

