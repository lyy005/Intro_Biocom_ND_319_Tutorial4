#!/usr/bin/env bash
#unique gender and years experience combinations
#Usage wages.csv 

for file in wages.csv
do
cat $file | tr -s "," | cut -d "," -f 1,2 | sed 's/,/ /' | sort -b  -k1,1 -k2,2n | uniq >>problem.txt
done
