# a script for determining gender and wages of highest and lowest earning workers. 
# Also tells the number of females in the top 10 earners in the data sel
# Usage: bash part2.sh wages.csv

cat wages.csv | sort -n -k 4 | tail -n 1 | tr -s " " | cut -d " " -f 1,2
