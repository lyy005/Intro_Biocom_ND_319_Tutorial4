grep -E 'female|male' wages.csv|cut -d ',' -f 1-2|sed 's/,/ /g'|sort -k 1,1 -k 2,2n -u>exercise_4_1.txt
