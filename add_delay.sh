#!/bin/bash

INTERFACE=$1
DELAY=$2


echo "======== Before delay is added ========"
tc qdisc show dev $INTERFACE


tc qdisc add dev $INTERFACE root netem delay "$DELAY"ms


echo "======== After delay is added ========"
tc qdisc show dev $INTERFACE

