# a script for determining gender and wages of highest and lowest earning workers. 
# Also tells the number of females in the top 10 earners in the data sel
# Usage: bash part2.sh wages.csv

echo "information for lowest wage earner" 
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | head -n 1 | cut -d " " -f 1,2,4
echo "information for highest wage earner" 
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | tail -n 1 | cut -d " " -f 1,2,4
echo "number of females in the top ten earners" 
cat wages.csv | tr "," " " | sort -n -k 4 | tail -n 10 | grep "female" | wc -l

# part 4 of challenge
# calculates difference between minimum wage of personw ith 16 years of school and 12 years of school
echo "diffrence of minimum wages for person with 12 years and 16 years school" 
val1=$(cat wages.csv | tr "," " " | cut -d " " -f 3,4 | grep "12 " | sort -n -k 2 | head -n 1 | cut -d " " -f 2) 
val2=$(cat wages.csv | tr "," " " | cut -d " " -f 3,4 | grep "16 " | sort -n -k 2 | head -n 1 | cut -d " " -f 2)
echo "$val2 - $val1" | bc 
