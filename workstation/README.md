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
