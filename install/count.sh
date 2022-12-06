#!/bin/bash
search=$1
count=0
for ((i=10;i<=30;i+=1))
do
day=`zcat access_2022-11-$i.log.gz | grep "$search" | wc -l`
echo 2022-11-$i:$day
let count=$count+$day
echo $count
done
val=`expr $count / 20`
echo $val