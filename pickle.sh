!#/bin/bash

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
