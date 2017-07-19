#!/bin/bash

for model in `cat data/models`
do
     cat data/$model.file |	sed -e 's/^   //g' -e 's/\s/\t/' -re '/^[0-9A-Z]{6}-[0-9]{3}|^[0-9A-Z]{6}/!d'  | 
     		sort -k2  | 
     			 	uniq | 
     			 		 awk 'BEGIN{OFS=FS="\t"} {$2=substr($2,1,34)}1' > data/$model.fmt
done
