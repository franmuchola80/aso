#!/bin/bash

read -p "Introduce un número: " N

for i in {1..10}; do
    echo "$i x $N = $((i * N))"
done
