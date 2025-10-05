#!/bin/bash

numero_a_adivinar=42   # Número fijo a adivinar

echo "Adivina el número entre 1 y 100. Introduce 0 para rendirte."

while true; do
    read -p "Introduce un número: " intento

    if [ "$intento" -eq 0 ]; then
        echo "Te has rendido. El número era $numero_a_adivinar."
        break
    elif [ "$intento" -lt "$numero_a_adivinar" ]; then
        echo "El número es mayor."
    elif [ "$intento" -gt "$numero_a_adivinar" ]; then
        echo "El número es menor."
    else
        echo "¡Enhorabuena! Has acertado el número."
        break
    fi
done
