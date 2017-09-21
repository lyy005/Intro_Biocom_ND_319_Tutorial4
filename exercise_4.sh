#Question 1
grep -E 'female|male' wages.csv|cut -d ',' -f 1-2|sed 's/,/ /g'|sort -k 1,1 -k 2,2n -u>exercise_4_1.txt
#Question 2
#the gender, yearsExerince, wage for the highest earner 
echo "gender, yearsExerince, wage for the highest earner" > stdout.txt
grep -E 'female|male' wages.csv|cut -d ',' -f 1,2,4|sed 's/,/ /g'|sort -k 3 -n|tail -n 1 >> stdout.txt
#the gender, yearsExerince, wage for the lowest earner 
echo "gender, yearsExerince, wage for the lowest earner" >> stdout.txt
grep -E 'female|male' wages.csv|cut -d ',' -f 1,2,4|sed 's/,/ /g'|sort -k 3 -n|head -n 1 >> stdout.txt
#the number of females in the top ten earners 
echo "the number of females in the top ten earners" >> stdout.txt
grep -E 'female|male' wages.csv|cut -d ',' -f 1,2,4|sed 's/,/ /g'|sort -k 3 -n|tail -n 10|grep -E 'female'|wc -l >> stdout.txt
#Question 3
echo "yearsExperience vs minimum_wage" >> stdout.txt
grep -E 'female|male' wages.csv|cut -d ',' -f 3,4|sed 's/,/ /g'|sort -k 1,1 -k 2,2n|sort -buk1,1|sed -n -e 3p -e 7p >> stdout.txt

