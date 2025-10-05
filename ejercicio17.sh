#!/bin/bash

SUMA=0

while true; do
    read -p "Introduce un número (0 para salir): " NUM
    if [ "$NUM" -eq 0 ]; then
        break
    fi
    SUMA=$((SUMA + NUM))
done

echo "Suma total: $SUMA"
