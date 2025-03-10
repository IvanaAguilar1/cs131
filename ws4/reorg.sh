#!/bin/bash

#Getting the current date and time
datetime=$(date "+%F-%T")

#The taxi dataset path
input_file="/home/ivana_aguilar/taxi_dataset.csv"

#Create files for each vendor and extract the data for each vendor
for vendor_id in 1.0 2.0 4.0; do
    output_file="${datetime}-${vendor_id}.csv"

    #Filter the data with vendorid
    awk -F, -v vendor="$vendor_id" '$1 == vendor { print $0 }' "$input_file" > "$output_file"

    #Add the file to .gitignore
    if ! grep -q "$output_file" .gitignore; then
        echo "$output_file" >> .gitignore
    fi
done

#Create ws4.txt with wc command output
for vendor_id in 1.0 2.0 4.0; do
    output_file="${datetime}-${vendor_id}.csv"
    wc "$output_file" >> ws4.txt
done

#Results go to and show in ws4.txt
cat .gitignore >> ws4.txt

echo "Done! Check ws4.txt for the results."
