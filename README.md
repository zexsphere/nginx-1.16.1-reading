# reading-nginx-1.16.1

Setting up the environment and reading the code.

## usage

```shell
# 1. generate docker image
$ docker build -t nginx-env .

# 2. generate docker container
$ docker compose up -d

# 3. read code locally
# use vscode or whatever

# 4. debugging remotely (enter this container)
$ docker exec -it nginx /bin/bash
```

## compile & run

```shell
# operator in container
$ cd 1.16.1
$ ./configure
$ make -j4 
$ make install 

$ /usr/local/nginx/sbin/nginx
```

## dev process

Confirm what you have thought of. Take `ngx_http_hello_module` as an example:

use **static**

```shell
# operator in container
$ cd 1.16.1
$ ./configure --add-module=/code/ngx_http_hello_module
$ make -j4 
$ make install
```

or use **dynamic**

```shell
# operator in container
$ cd 1.16.1
$ ./configure --add-dynamic-module=/code/ngx_http_hello_module
$ make -j4 
$ make install
```

then

```shell
# operator in container
# verify conf & run
$ /usr/local/nginx/sbin/nginx -t -c /code/ngx_http_hello_module/nginx.conf 
$ /usr/local/nginx/sbin/nginx -c /code/ngx_http_hello_module/nginx.conf 

# another window (both inside and outside work)
$ curl -v 'http://localhost/hello'
```

## refer
- *Nginx完全开发指南 - 使用C、C++、JavaScript和Lua* 罗剑锋著