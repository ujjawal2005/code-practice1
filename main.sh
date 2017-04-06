#!/bin/bash

# declare an associative array
declare -A arr
cp $1 ./output/$1

# read file line by line and populate the array. Field separator is "="
while IFS='=' read -r k v; do
   arr["$k"]="$v"
   sed -ie "s/\[\[\($k[^]]*\)\]\]/$v/g" ./output/$1
done < $2