#!/bin/bash

verbose=$1
shift
mandir=$1
shift
importdir=$1
shift
asciidoc=$1
shift
scriptdir=$1
shift

for pagedef in "$@"
do
  set -- $pagedef
  page=$1
  component=$2
  echo "-----------------------------------------------------------------------------"
  echo "Creating manpage '$page' from component '$component' at $mandir/${page}.1.xml"

  "$asciidoc" $verbose -b docbook45 -d  manpage -o "$mandir/${page}.1.xml" "$importdir/neo4j-${component}-docs-jar/man/${page}.1.asciidoc"
  #gzip -qf "$mandir/${page}.1"
done

echo "-----------------------------------------------------------------------------"

