#!/bin/bash

read -p "Introduce el primer número: " NUM1
read -p "Introduce el segundo número: " NUM2
read -p "Selecciona la operación (1=Sumar, 2=Restar, 3=Multiplicar, 4=Dividir): " OPCION
case $OPCION in
    1) RESULTADO=$((NUM1 + NUM2)) ;;
    2) RESULTADO=$((NUM1 - NUM2)) ;;
    3) RESULTADO=$((NUM1 * NUM2)) ;;
    4) RESULTADO=$((NUM1 / NUM2)) ;;
    
esac

echo "Resultado: $RESULTADO"
