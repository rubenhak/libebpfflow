# Building Inside Docker Container

```sh
$ ./build-image.sh
$ ./run-builder.sh
```

Inside docker:
```sh
$ git clean -fdx 
$ ./autogen.sh
$ make
$ ./ebpflowexport -v
```

# Running
TCP Events:
```sh
$ ./ebpflowexport -tio
Welcome to ebpflowexport v.1.0.200203
(C) 2018-19 ntop.org
Initializing eBPF [Legacy API]...
Unable to initialize libebpfflow: ebpf_kprobe_attach_error
eBPF terminated
```

TCP Close Events:
```sh
root@0fbd61fa0217:/usr/libbpfflow.git# ./ebpflowexport -c  
Welcome to ebpflowexport v.1.0.200203
(C) 2018-19 ntop.org
Initializing eBPF [Legacy API]...
eBPF initializated successfully
* Terminating * 
eBPF terminated
```

UDP Events:
```sh
root@0fbd61fa0217:/usr/libbpfflow.git# ./ebpflowexport -u
Welcome to ebpflowexport v.1.0.200203
(C) 2018-19 ntop.org
Initializing eBPF [Legacy API]...
eBPF initializated successfully
1580763732.087550 [enp0s3][Rcvd][IPv4/UDP][pid/tid: 0/0 [], uid/gid: 0/0][father pid/tid: 0/0 [], uid/gid: 0/0][addr: 192.168.0.30:5353 <-> 224.0.0.251:5353]
1580763732.087591 [enp0s3][Rcvd][IPv4/UDP][pid/tid: 0/0 [], uid/gid: 0/0][father pid/tid: 0/0 [], uid/gid: 0/0][addr: fe80::1c4f:4143:bc2:4a4a:5353 <-> ff02::fb:5353]
1580763732.358483 [enp0s3][Rcvd][IPv4/UDP][pid/tid: 0/0 [], uid/gid: 0/0][father pid/tid: 0/0 [], uid/gid: 0/0][addr: 192.168.0.25:5353 <-> 224.0.0.251:5353]
```

