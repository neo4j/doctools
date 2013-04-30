#!/bin/bash

srcdir=$1
imgdir=$2
path=$3

mkdir -p "${imgdir}"
find "${srcdir}" -path ${path} -type d -print | while read i; do 
  cp -fr "${i}"/* "${imgdir}"
done

