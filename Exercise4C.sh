for wage in $@
do
#for input, go with the higher numbered term first and only using the format gender,yearsOfschooling, for example, "male,16" or "female,16"
cut -d , -f1,3,4 wages.csv | grep -we $wage | cut -d , -f3 | sort -rn | tail -n 1
done
