#!/bin/bash

##   Copyright 2022 Georgia Tech Kernel Lab
##
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at
##
##       http://www.apache.org/licenses/LICENSE-2.0
##
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.

INTERFACE=$1
IP=$2
ID=$3

echo "======== Before queue is created ========"
tc qdisc show dev $INTERFACE

tc filter add dev $INTERFACE protocol ip parent 1: prio 1 u32 match ip dst $IP/32 flowid 1:$ID
tc qdisc add dev $INTERFACE parent 1:"$ID" handle "$ID"0: fq_codel

echo "======== After queue is created ========"
tc qdisc show dev $INTERFACE
