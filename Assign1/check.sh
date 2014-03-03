#!/bin/bash
for i in $(seq -f "%02g" 1 19)
do
 echo "Processing file tests/in$i"
 ./demo tests/in$i > outputs/out$i 
done

for i in $(seq -f "%02g" 1 19)
do
 echo "Processing output file tests/in$i"
 diff tests/out$i outputs/out$i
done

