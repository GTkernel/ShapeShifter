#!/bin/bash

INTERFACE=$1
IP=$2
ID=$3
RATE_mb=$4
BURST_kb=$5
LATENCY_ms=$6

echo "======== Before queue is created ========"
tc qdisc show dev $INTERFACE

tc filter add dev $INTERFACE protocol ip parent 1: prio 1 u32 match ip dst $IP/32 flowid 1:$ID
tc qdisc add dev $INTERFACE parent 1:"$ID" handle "$ID"0: tbf rate "$RATE_mb"mbit burst "$BURST_kb"kbit latency "$LATENCY_ms"ms

echo "======== After queue is created ========"
tc qdisc show dev $INTERFACE
