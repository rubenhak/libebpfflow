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

# Current Error
Generating:
```sh
root@91c40d059526:/usr/libbpfflow.git# ./autogen.sh
Wait please...

Now running ./configure
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking how to run the C preprocessor... gcc -E
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking for printf in -lbcc... yes
checking eBPF library new API version... no
checking for json_object_new_object in -ljson-c... yes
checking for curl_easy_init in -lcurl... yes
checking for zmq_socket_monitor in -lzmq... yes
checking for json_object_new_double_s in -ljson-c... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating config.h
```

Compiling: 
```sh
root@91c40d059526:/usr/libbpfflow.git# make
g++ -c -std=c++11 -g -Wall -I/usr/include/json-c -DHAVE_JSONC -I/usr/include/x86_64-linux-gnu -DHAVE_LIBCURL container_info.cpp -o container_info.o
echo -n "const char * ebpf_code = R\"(" > ebpflow.ebpf.enc
cat ebpflow_header.ebpf ebpf_types.h ebpflow_code.ebpf | base64 -w 0  >> ebpflow.ebpf.enc
echo ")\";" >> ebpflow.ebpf.enc
g++ -c -I /usr/include/bcc/compat -std=c++11 -g -Wall -I/usr/include/json-c -DHAVE_JSONC -I/usr/include/x86_64-linux-gnu -DHAVE_LIBCURL -I /usr/include/bcc/compat ebpf_flow.cpp -o ebpf_flow.o
ar rvs libebpfflow.a ebpf_flow.o container_info.o
ar: creating libebpfflow.a
a - ebpf_flow.o
a - container_info.o
g++ -I /usr/include/bcc/compat -std=c++11 -g -Wall -I/usr/include/json-c -DHAVE_JSONC -I/usr/include/x86_64-linux-gnu -DHAVE_LIBCURL ebpflowexport.cpp -o ebpflowexport libebpfflow.a -lbcc -lzmq -ljson-c -lcurl
```

Running:
```sh
root@91c40d059526:/usr/libbpfflow.git# ./ebpflowexport -v
Welcome to ebpflowexport v.1.0.200203
(C) 2018-19 ntop.org
Initializing eBPF [Legacy API]...
sh: 1: modprobe: not found
chdir(/lib/modules/4.9.184-linuxkit/build): No such file or directory
Unable to initialize libebpfflow: ebpf_initialization_failed
eBPF terminated
```

Installing kmod does not help much:
```sh
root@91c40d059526:/usr/libbpfflow.git# apt-get install kmod

root@91c40d059526:/usr/libbpfflow.git# ./ebpflowexport -v
Welcome to ebpflowexport v.1.0.200203
(C) 2018-19 ntop.org
Initializing eBPF [Legacy API]...
modprobe: ERROR: ../libkmod/libkmod.c:586 kmod_search_moddep() could not open moddep file '/lib/modules/4.9.184-linuxkit/modules.dep.bin'
modprobe: FATAL: Module kheaders not found in directory /lib/modules/4.9.184-linuxkit
chdir(/lib/modules/4.9.184-linuxkit/build): No such file or directory
Unable to initialize libebpfflow: ebpf_initialization_failed
eBPF terminated