#!/bin/bash
# Guardar número introducido por el usuario
read -p "Introduce un número: " NUM

# Comprobar si el número es par o impar usando el operador módulo
if [ $((NUM % 2)) -eq 0 ]; then
    echo "El número $NUM es par"
else
    echo "El número $NUM es impar"
fi
