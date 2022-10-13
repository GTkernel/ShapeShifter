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
the space of control plane. You can take steps below as reference:

```
// cd to the root of this repo, build the image
$ docker build -t ss .


```

### Introduction of tools (scripts) 

## MEC application usecases in paper

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

