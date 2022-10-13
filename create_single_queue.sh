#!/bin/bash

INTERFACE=$1
RATE_mb=$2
BURST_kb=$3
LATENCY_ms=$4

echo "======== Before queue is created ========"
tc qdisc show dev $INTERFACE

tc filter add dev $INTERFACE protocol ip parent 1: prio 1 u32 match ip protocol 1 0xff flowid 1:1
tc qdisc add dev $INTERFACE parent 1:1 handle 10: tbf rate "$RATE_mb"mbit burst "$BURST_kb"kbit latency "$LATENCY_ms"ms

echo "======== After queue is created ========"
tc qdisc show dev $INTERFACE
