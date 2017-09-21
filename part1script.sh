#!
#how to complete part 1 for Exercise 4 Challenge

# copies data from wages.csv to new file called part1challenge.csv
cp wages.csv part1challenge.csv

#remove 1st line w/ column titles(allows for no confusion in further commands)
sed -i '1d' wages.csv

#remove columns other than gender and yearsExperience; sort 1st by gender then numerically by yearsExperience(keeping pairs together); replace comma delemiter with space
awk '{print $1,$2}' $filename | sort -t, -k1,1 -nk2,2 | cut -d, -f1,2 | tr ',' ' '
