#! /bin/bash

# retrieve At 10 docs precision
rm $PWD/static.csv;
echo "file_name,Precision at 10,R-precision,Average Precision" > $PWD/static.csv ;
for file in ./*;
do
    if [[ "$file" == *.txt ]]; then
        file_name=$(echo $file | cut -c 10- | sed 's/\(.txt\)$//g') ;

        echo "$file_name,"$(tail -n 31 $file|grep -e "^  At   10 docs:"|awk -F " " '{print $4}')","$(tail -n 31 $file|grep -e "^    Exact:"|awk -F " " '{print $2}')","$(tail -n 31 $file|grep -e "^                  "|awk -F " " '{print $1}') >> $PWD/static.csv;

    fi
done
