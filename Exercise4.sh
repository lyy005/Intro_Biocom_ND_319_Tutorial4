


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

#Minimum wages of 12 vs 16 years school
$ cat wages.csv | awk -F, '$3 = "12"' | sort -n -k "4" | head -2 | tail -1

