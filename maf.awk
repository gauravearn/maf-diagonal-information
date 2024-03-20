#!/usr/bin/awk
# Author: Gaurav Sablok
# date: 2024-3-20
# Universitat Potsdam
# check the cordinates of the maf alignments, sample maf file is present in the repository 
# adding the regular pattern for the strand align 
declare -a firstcor=()
for i in $(cat test.maf | awk ' { print $2 }' | cut -f 1 -d "/" | grep "+$" | sed "s/+//g");
do 
        firstcor+=("${i}")
done
declare -a secondcor=()
for i in $(cat test.maf | awk ' { print $2 }' | cut -f 1 -d "/" | grep "+$" | sed "s/-//g")
do 
        secondcor+=("${i}")
done
for i in ${firstcor[*]}; 
do 
   grep "${i}" $1
done << $1
for i in ${secondcor[*]}; 
do 
   grep "${i}" $1
done << $1
