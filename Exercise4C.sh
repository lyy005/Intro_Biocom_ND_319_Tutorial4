#for input, go with the higher numbered term first and only using the format gender,yearsOfschooling, for example, "male,16" or "female,16"
a=$(cut -d , -f1,3,4 wages.csv | grep -we "$1" | cut -d , -f3 | sort -rn | tail -n 1)
b=$(cut -d , -f1,3,4 wages.csv | grep -we "$2" | cut -d , -f3 | sort -rn | tail -n 1)
echo "$a-$b" | bc 

