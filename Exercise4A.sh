grep -w "female" wages.csv | cut -d , -f1,2 | tr ',' ' ' | sort -n -k2 | uniq >> Wages1.txt
grep -w "male" wages.csv | cut -d , -f1,2 | tr ',' ' ' | sort -n -k2 | uniq >> Wages1.txt

