#!/bin/bash

srcdir=$1
imgdir=$2
path=$3

find "${srcdir}" -path ${path} ! -wholename "*target*" -type d -print | while read i; do 
  cp -fr "${i}"/* "${imgdir}"
done

