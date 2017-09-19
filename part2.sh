# a script for determining gender and wages of highest and lowest earning workers. 
# Also tells the number of females in the top 10 earners in the data sel
# Usage: bash part2.sh wages.csv

echo "information for lowest wage earner" 
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | head -n 1 | cut -d " " -f 1,2,4
echo "information for highest wage earner" 
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | tail -n 1 | cut -d " " -f 1,2,4
echo "number of females in the top ten earners" 
cat wages.csv | tr "," " " | sort -n -k 4 | tail -n 10 | grep "female" | wc -l
