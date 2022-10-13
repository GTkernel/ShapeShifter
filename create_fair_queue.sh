#!/bin/bash

INTERFACE=weave
IP=$1
ID=$2
RATE_mb=$3
BURST_kb=$4
LATENCY_ms=$5


echo "======== Before queue is created ========"
tc qdisc show dev $INTERFACE

tc filter add dev $INTERFACE protocol ip parent 1: prio 1 u32 match ip dst $IP/32 flowid 1:$ID
tc qdisc add dev $INTERFACE parent 1:"$ID" handle "$ID"0: fq_codel

echo "======== After queue is created ========"
tc qdisc show dev $INTERFACE
