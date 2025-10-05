#!/bin/bash

# Pedir la palabra al usuario
read -p "Introduce una palabra: " PALABRA

# Añadir la palabra al fichero lista.txt
echo "$PALABRA" >> lista.txt

# Mostrar el contenido actualizado del fichero
echo "Contenido actual de lista.txt:"
cat lista.txt
