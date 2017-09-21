#Script prints the following information for a given dataset:
#Gender, years of Experience, wage for highest earner
#Gender, years of experience, wage for lowest earner
#Number of women in top 10 earners

#Usage: earnings.sh filename.csv

echo "Highest Earner:"

cat $1 | sed s/","/" "/g | sort -n -k4 | tail -n 1 | cut -d ' ' -f 1,2,4

echo "Lowest Earner:"

cat $1 | sed s/","/" "/g | sort -n -k4 | head -n 2 | tail -n 1 | cut -d ' ' -f 1,2,4

