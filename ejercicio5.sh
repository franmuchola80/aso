#!/bin/bash

# Pedir primer número
read -p "Introduce el primer número: " NUM1

# Pedir segundo número
read -p "Introduce el segundo número: " NUM2

# Calcular la media aritmética
MEDIA=$(( (NUM1 + NUM2) / 2 ))

# Mostrar la media
echo "La media aritmética es: $MEDIA"
