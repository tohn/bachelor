#!/bin/bash

root=$(dirname $0)
name="products_ingredients"
file="$root/$name.tmp"
rfile="$root/$name.r"
data="$root/$name.dat"

# remove some lines and spaces
sed '2d' $file | tac | sed '1,2d' | tac > $file.bak
mv $file.bak $file
sed -i 's/\ //g' $file
