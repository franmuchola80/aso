#!/bin/bash
# Guardar primer número en variable
read -p "Introduce el primer número: " NUM1

# Guardar segundo número en variable
read -p "Introduce el segundo número: " NUM2

# Comparar los números y mostrar cuál es mayor
if [ "$NUM1" -gt "$NUM2" ]; then
    echo "El número $NUM1 es mayor que $NUM2"
elif [ "$NUM2" -gt "$NUM1" ]; then
    echo "El número $NUM2 es mayor que $NUM1"
else
    echo "Ambos números son iguales"
fi
