for wage in $1, $2
do
#for input, go with the higher numbered term and only using the format gender,yearsOfschooling, for example, "male,16" or "female,16"
cut -d , -f1,3,4 wages.csv | grep -we "$1" | cut -d , -f3 | sort -rn | tail -n 1 
cut -d , -f1,3,4 wages.csv | grep -we "$2" | cut -d , -f3 | sort -rn | tail -n 1
done
