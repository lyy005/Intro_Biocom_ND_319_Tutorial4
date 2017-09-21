#!

#Script prints the following information for a given dataset:
#Gender, years of Experience, wage for highest earner
#Gender, years of experience, wage for lowest earner
#Number of women in top 10 earners

#Usage: earnings.sh filename.csv

cat $1 | sed 's/","/" "/g" | sort -n -k5
