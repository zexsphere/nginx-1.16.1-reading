#!/bin/bash

NGX_ROOT=`pwd`/1.16.1
NGX_SRCS=`pwd`/1.16.1/src

export NGX_ROOT
export NGX_SRCS

doxygen Doxyfile
