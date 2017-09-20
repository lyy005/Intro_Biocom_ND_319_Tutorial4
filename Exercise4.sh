


#Q2
#Print gender, yearsExperience, and wage for highest earner
echo "Highest Earner"
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -n -k 3 | head -2 | tail 
-1
#Print gender, yearsExperience, and wage for lowest earner
echo "Lowest Earner"
cat wages.csv | sed 's/,/ /g' | cut -d ' ' -f 1,2,4 | sort -n -k 3 | tail -1

