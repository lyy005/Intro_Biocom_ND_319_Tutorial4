#!/usr/bin/env bash

################################################################################
# Part 1 by Zoe
#!/usr/bin/env bash
#unique gender and years experience combinations
#Usage wages.csv

for file in wages.csv
do
cat $file | tr -s "," | cut -d "," -f 1,2 | sed 's/,/ /' | sort -b  -k1,1 -k2,2n | uniq >>problem.txt
done

################################################################################
#Part 2 by Soren

HEADLINE=$(head -n 1 wages.csv |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')
#echo $HEADLINE

#tail wages.csv -n +2 | sort -k 4 -t ',' -n >> result.txt
#SORTED=$(tail wages.csv -n +2 | sort -k 4 -t ',' -n)
HIGHEST=$(tail wages.csv -n +2 | sort -k 4 -t ',' -n | tail -n 1 |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')
LOWEST=$(tail wages.csv -n +2 | sort -k 4 -t ',' -n | head -n 1 |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')

echo "-------------"
echo "Highets earner"
echo $HEADLINE
echo $HIGHEST
echo "-------------"
echo "Lowest earner"
echo $HEADLINE
echo $LOWEST
echo "-------------"

TOP10=$(tail wages.csv -n +2 | sort -k 4 -t ',' -n | tail -n 10 |  awk -F ','  '{printf("%s \n",$1)}')
#echo $TOP10
COUNTER=$((0))
#echo $COUNTER
for GENDER in $TOP10
do
  #echo $GENDER
  if [ $GENDER == "female" ]
  then
    ((COUNTER++))
  fi
  #echo $COUNTER
done


echo "Number of women in top 10 earners:"
echo $COUNTER
echo "-------------"

################################################################################
#Part 3 by Soren and Zoe

COUNTERHIGHSCHOOL=$((0))
HIGHSCHOOLTOTALWAGES=$((0))
COUNTERCOLLEGE=$((0))
COLLEGETOTALWAGES=$((0))
for LINE in $(cat wages.csv)
do
  #echo $LINE
  SCHOOLYEARS=$(echo $LINE | awk  -F ','  '{printf("%d",$3)}')
  if [ $SCHOOLYEARS == 12 ]
  then
    ((COUNTERHIGHSCHOOL++))
    WAGE=$(echo $LINE | awk  -F ','  '{printf("%f",$4)}')
    HIGHSCHOOLTOTALWAGES=$(echo "$HIGHSCHOOLTOTALWAGES + $WAGE" | bc)
    #echo $HIGHSCHOOLTOTALWAGES
  fi
  if [ $SCHOOLYEARS == 16 ]
  then
    ((COUNTERCOLLEGE++))
    WAGE=$(echo $LINE | awk  -F ','  '{printf("%f",$4)}')
    COLLEGETOTALWAGES=$(echo "$COLLEGETOTALWAGES + $WAGE" | bc)
    #echo $COLLEGETOTALWAGES
  fi

  #echo $SCHOOLYEARS
  #WAGE=$(echo $LINE | awk  -F ','  '{printf("%f",$4)}')
  #echo $WAGE
done
#echo $(awk '{printf("%s %s","Hello", "World")}')
#echo $COUNTERHIGHSCHOOL
#echo $HIGHSCHOOLTOTALWAGES
AVGEHIGHSCHOOLWAGES=$(echo "$HIGHSCHOOLTOTALWAGES / $COUNTERHIGHSCHOOL" | bc -l)
#echo $COUNTERCOLLEGE
#echo $COLLEGETOTALWAGES
AVGCOLLEGEWAGES=$(echo "$COLLEGETOTALWAGES / $COUNTERCOLLEGE" | bc -l)

echo $AVGEHIGHSCHOOLWAGES
echo $AVGCOLLEGEWAGES
echo "$COUNTERHIGHSCHOOL high school graduates (12 years) earned an average of $AVGEHIGHSCHOOLWAGES USD/h"
echo "$COUNTERCOLLEGE college graduates (16 years) earned an average of $AVGCOLLEGEWAGES USD/h"
echo "-------------"
