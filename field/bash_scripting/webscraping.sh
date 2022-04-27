#!/bin/bash

url="https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops"

echo -e "\nScrapping ...\n"
# awk '!(NR%2){print$0p}{p=$0}'
#curl -# $url | grep '<h4 class="pull-right price">\|<p class="description">' | sed 's:<[^>]*>::g' | sed '$!N;s/\n/;/' > result1.txt

output=$(curl -s $url)
description=$(echo $output | grep "class=\"description\"" | cut -d ">" -f2 | cut -d "<" -f1 )
# price=$(echo $output | grep "class=\"pull-right price\"" | cut -d ">" -f2 | cut -d "<" -f1 )
# laptop=$(paste -d "|" ${description} ${price})

# echo $description