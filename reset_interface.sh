#!/bin/bash

INTERFACE=weave

# back to initial state
echo "======== Before queues are cleaned ========"
tc qdisc show dev $INTERFACE

tc qdisc del dev $INTERFACE root

tc qdisc add dev $INTERFACE root handle 1: prio

echo "======== After queues are cleaned ========"
tc qdisc show dev $INTERFACE

