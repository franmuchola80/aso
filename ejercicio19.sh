#!/bin/bash

# Bucle del 1 al 5
for i in {1..5}
do
    # Repetir el número 'i', 'i' veces
    for ((j=1; j<=i; j++))
    do
        echo -n "$i"
    done
    # Salto de línea después de cada número repetido
    echo
done
