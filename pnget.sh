#!/bin/bash
# A line to test a simple change
# another my_brach line
# anoher new newbrach line 
for model in `cat models`
do


	for i in `cat $model`
 		do
		echo $model
 		lynx -dump -nolist "http://partsurfer.hpe.com/Search.aspx?type=PROD&SearchText=$i" | 
 				awk '/[0-9]{6}-[0-9]{3}/ || / [A-Z,0-9]{6} /' | 
 					tee -a  $model.file
 		done


done

