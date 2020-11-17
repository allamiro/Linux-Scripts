#!/bin/bash

for i in {1..100}; do
        output="\r"

        output="$output ["
        total=$i
        count=0

        while [ $count -lt $total ]; do
                output="$output#"
                let count=$count+1
        done

        let total=100-$total
        count=0

        while [ $count -lt $total ]; do
                output="$output "
                let count=$count+1
        done
        output="$output] $i%"
        echo -ne "$output"

        sleep .01
done

printf "\n"
