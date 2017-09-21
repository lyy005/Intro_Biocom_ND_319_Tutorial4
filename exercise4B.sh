#To return the gender, yearsExperience, and wage of the lowest earner to stdout

#To return the genfer, yearsExperience, and wage of the lowest earner to stdout

#To return number of female wage earners to stdout

var1=$(cat $filename | sort -k4 -n | cut -d ',' -f1,2,4 | head -n 2 | tail -n 1)
var2=$(cat $filename | sort -k4 -n -g | cut -d ',' -f1,2,4 | tail -n 1)
var3=$(cat $filename | sort -k4 -n -g | cut -d ',' -f1,2,4 | tail -n 10| grep -w "female" | wc -l)
echo $var1 $var2 $var3





