

### BELOW THIS IS WHAT OM & THOMAS DID FOR CHALLENGE 2
for file in *.csv
do

val1=cat $file |grep "m" |cut -d "," -f 3,4 | grep "12," | cut -d "," -f 2 | tr "\n" " " | perl -ne 'use List::Util qw(sum);  @arr = split(" ", $_); print sum(@arr)/@arr."\n"'
val2=cat $file |grep "m" |cut -d "," -f 3,4 | grep "16," | cut -d "," -f 2 | tr "\n" " " | perl -ne 'use List::Util qw(sum);  @arr = split(" ", $_); print sum(@arr)/@arr."\n"'
echo "Highest Earner:"
cat $file | head -n1
cat $file |grep "m"|sort -k4 -n -t, -r| head -n1

echo "Lowest Earner:"
cat $file | head -n1
cat $file |grep "m"|sort -k4 -n -t, -r| tail -n1


echo "Number of Females in Top-10 Earners:"
cat $file |grep "m"|sort -k4 -n -t, -r|head -n10 | grep "female" | wc -l

echo "Difference in wages between 12 and 16 year degree:"
echo "$val2 - $val1" | bc
done
