#Q1
#write a file containing unique gender and years experience in two space deliminated columns
#input = wages.csv
#output uni.gen.exp.csv
cat wages.csv | cut -d ',' -f1,2 | sed 's/\<[0-9]\>/0&/' | sed 's/,/ /g' > a.tmp.csv
head -1 a.tmp.csv > u.gender.year.csv
sed '1d' a.tmp.csv |  sort -n | uniq >> u.gender.year.csvhead -1 a.tmp.csv > uni.gen.exp.csv
echo "unique gender and experience .csv complete"

#Q2
#Print gender, yearsExperience, and wage for highest earner
echo "Highest Earner"
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -n -k 3 | tail -1 

#Print gender, yearsExperience, and wage for lowest earner
echo "Lowest Earner"
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -n -k 3 | head -2 | tail -1

#Number of females in top 10 earners
echo "Number of Females in Top 10 Earners"
cat wages.csv | sed 's/,/ /g' | sort -n -k 4 | tail -10 | grep "female" | wc -l

#Q3
#Minimum wages of 12 vs 16 years school
val1=$(cat wages.csv | sed 's/,/ /g' | awk -F, '$3 = "12"' | sort -n -k "4" | cut -d ' ' -f 4 | head -2 | tail -1)
val2=$(cat wages.csv | sed 's/,/ /g' | awk -F, '$3 = "16"' | sort -n -k "4" | cut -d ' ' -f 4 | head -2 | tail -1)
echo "Min wage 12 years school"
echo $val1
echo "Min wage 16 years school"
echo $val2
#Difference in wages based on school years
echo "$val2 - $val1" | bc



