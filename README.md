# ShapeShifter

This repo covers the prototype and tools for ShapeShifter.

## Tools for Lambda Enforcer and Kubernetes integration

### System prerequisite

For running the tools here, you can directly run them on your Linux server, 
since we only required the `tc` command. 
It is recommended to run in your MEC Kubernetes testbed.

The instruction of our MEC testbed is covered as following:
* [Kubernetes](https://github.com/GTkernel/kubernetes-cluster-deployment): with the CNI, WeaveNet.
* vRAN, the LTE testbed by [NextEPC](https://github.com/GTkernel/nextepc)'s core network; 
and [SrsRAN](https://github.com/GTkernel/srsRAN)'s eNB and UE.

### Docker image creation and K8s deployment

Dockerfile and Kubernetes configuration file, `./ss.yml`, helps to deploy tools in
the space of control plane. 

In the K8s configuration file, 
be careful of the indicated node (`nodeSelector`) for deployment, the name of image,
and the CNI gateway interface (`weave` in command).
You should change them to fit your environment.
Also, you can adjust other setup like the running time (default: 1h), 
preprocessing and post processing, etc.


You can take steps below as reference:

```
// cd to the root directory of this repo, build the image
$ docker build -t ss .

// deploy shape enforcer tools
$ kubectl create -f ss.yml
```


### Introduction of tools (scripts) 

|File |  Purpose  |Input parameter(s) |
|-----|-----------|-------------------|
|`create_queue.sh`| create a queue with specific shape rules | interface, dest IP, unique ID of queue, bitrate in mbit, burst size in kbit, latency in msec|
|`create_single_queue.sh`| same as above, but only expect to create one queue, so no need to specify IP and ID | interface, bitrate in mbit, burst size in kbit, latency in msec|
|`create_fair_queue.sh`| create a fair queue |interface, dest IP, unique ID of queue|
|`lc_queue_example.sh`| create single Lc queue with our example parameters |interface|
|`ls_queue_example.sh`| create single Ls queue with our example parameters |*ditto*|
|`reset_interface.sh`| clean the shape rules |*ditto*|
|`remove_qdisc.sh`| remove whole qdisc functions on interface, need to attach it again before creating queues, can run `reset_interface.sh` to get it back |*ditto*|
|`show_interface.sh`| show the queues on the interface |*ditto*|
|`add_delay.sh`/`delete_delay.sh`| add/delete certain number of millisecond delay on a specific network interface|*ditto*|

ShapeShifter requires to shape both ingress and egress traffics.
So, we will need to run tool twice for the traffics separately.

As describe in the paper's section *VI. IMPLEMENTATION* and *Fig. 6*, 
we shape the ingress traffic of MEC service at RAN node, and shape its egress traffic on MEC node.
While the ingress traffics on RAN node would be several of them, duo to several MEC service, we used to run `create_queue.sh` to specify each of them one by one; on the other hand, the egress traffic would be set on the vNIC of the MEC server, we can use `create_single_queue.sh`, since that vNIC is dedicated for this application.

## MEC application usecases in paper

* [Streamer](https://github.com/GTkernel/streamer): The latency-sensitive (Ls) use case, tagged as *ML*.
* [ROS](https://github.com/GTkernel/ros): The latency-critical (Lc) use case, tagged as *IA*.

## Paper reference

```bib
@inproceedings{shapeshifter,
  author    = {Valentin Rakavic
               Ke{-}Jou Hsu and
               Ketan Bhardwaj and
               Ada Gavrilovska and
               Liljana Gavrilovska},
  title     = {{ShapeShifter: Resolving the Hidden Latency Contention Problem in MEC}},
  booktitle = {Proceedings of the 7th {ACM/IEEE} Symposium on Edge Computing, {SEC}
               2022, Bellevue, WA, USA, December},
  publisher = {{ACM/IEEE}},
  year      = {2022},
  url       = {},
  doi       = {}
}
```

