#!/bin/bash

INTERFACE=$1

echo "======== Before queue discline is removed ========"
tc qdisc show dev $INTERFACE

tc qdisc del dev $INTERFACE root

echo "======== After queue discline is removed ========"
tc qdisc show dev $INTERFACE

