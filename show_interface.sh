#!/bin/bash

INTERFACE=$1

tc qdisc show dev $INTERFACE
