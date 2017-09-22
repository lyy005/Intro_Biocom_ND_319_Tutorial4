#!/usr/bin/env bash

################################################################################
# Part 1 by Zoe
#!/usr/bin/env bash
#unique gender and years experience combinations
#Usage wages.csv

cat wages.csv | tail -n +2 | tr -s "," | cut -d "," -f 1,2 | sed 's/,/ /' | sort -b  -k1,1 -k2,2n | uniq >>problem.txt

################################################################################
#Part 2 by Soren

HEADLINE=$(head -n 1 wages.csv |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')
HIGHEST=$(tail -n +2 wages.csv | sort -k 4 -t ',' -n | tail -n 1 |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')
LOWEST=$(tail -n +2 wages.csv | sort -k 4 -t ',' -n | head -n 1 |  awk -F ','  '{printf("%s %s %s\n",$1, $2, $4)}')

echo "-------------"
echo "Highest earner"
echo $HEADLINE
echo $HIGHEST
echo "-------------"
echo "Lowest earner"
echo $HEADLINE
echo $LOWEST
echo "-------------"

TOP10=$(tail -n +2 wages.csv | sort -k 4 -t ',' -n | tail -n 10 |  awk -F ','  '{printf("%s \n",$1)}')
COUNTER=$((0))
for GENDER in $TOP10
do
  if [ $GENDER == "female" ]
  then
    ((COUNTER++))
  fi
done


echo "Number of women among top 10 earners:"
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

  SCHOOLYEARS=$(echo $LINE | awk  -F ','  '{printf("%d",$3)}')
  if [ $SCHOOLYEARS == 12 ]
  then
    ((COUNTERHIGHSCHOOL++))
    WAGE=$(echo $LINE | awk  -F ','  '{printf("%f",$4)}')
    HIGHSCHOOLTOTALWAGES=$(echo "$HIGHSCHOOLTOTALWAGES + $WAGE" | bc)
  fi

  if [ $SCHOOLYEARS == 16 ]
  then
    ((COUNTERCOLLEGE++))
    WAGE=$(echo $LINE | awk  -F ','  '{printf("%f",$4)}')
    COLLEGETOTALWAGES=$(echo "$COLLEGETOTALWAGES + $WAGE" | bc)
  fi

done

AVGHIGHSCHOOLWAGES=$(echo "$HIGHSCHOOLTOTALWAGES / $COUNTERHIGHSCHOOL" | bc -l)
AVGCOLLEGEWAGES=$(echo "$COLLEGETOTALWAGES / $COUNTERCOLLEGE" | bc -l)
WAGEDIFFERENCE=$(echo "$AVGCOLLEGEWAGES - $AVGHIGHSCHOOLWAGES" | bc -l)

echo "$COUNTERHIGHSCHOOL high school graduates (12 years) earned an average of $AVGHIGHSCHOOLWAGES USD/h"
echo "$COUNTERCOLLEGE college graduates (16 years) earned an average of $AVGCOLLEGEWAGES USD/h"
echo "Wage difference: $WAGEDIFFERENCE"
echo "-------------"
