#!/bin/bash

# Número de filas
FILAS=5

for i in $(seq 1 $FILAS); do
    for j in $(seq 1 $i); do
        echo -n "$j"
    done
    echo ""  # Salto de línea
done
