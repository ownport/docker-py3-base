# docker-py3-base image

Docker image for python3 based on 
- Debian Linux https://github.com/ownport/docker-py3-base/tree/debian
- Alpine Linux https://github.com/ownport/docker-py3-base/tree/alpine

## How to use

```
$ docker pull ownport/py3-base:<version>-<dist>
```
where 
- `version` is the current image version
- `dist` is Linux distribution, debian or alpine

## Configuration

### Common

- `assets/conf/python.packages`, the file contains the list of python3 packeges which need to be installed via pip3
- `assets/conf/build-deps.packages`, the file contains the list of packages which are required during building/installation python packages. After installation python packages, these packages will be removes

### Debian specific

- `assets/conf/debian.packages`, the file contains the list of debian packeges which need to be installed

### Alpine specific

- `assets/conf/alpine.packages`, the file contains the list of debian packeges which need to be installed

