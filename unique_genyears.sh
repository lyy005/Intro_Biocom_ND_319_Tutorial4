tail -n +2 wages.csv | sort -k1,1  -k2,2n -t , -u | cut -d , -f1,2 | sed 's/,/ /g' > genyears.txt
