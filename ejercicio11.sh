#!/bin/bash

# Comprobar que hay dos parámetros
if [ $# -ne 2 ]; then
    echo "Error: debes indicar dos parámetros"
    exit 1
fi

# Comprobar que el primer parámetro existe y es un archivo
if [ ! -f "$1" ]; then
    echo "Error: el primer parámetro no es un archivo válido"
    exit 1
fi

# Comprobar que el segundo parámetro no existe
if [ -e "$2" ]; then
    echo "Error: ya existe un archivo o directorio con el nombre del segundo parámetro"
    exit 1
fi

# Copiar el archivo
cp "$1" "$2"
echo "Archivo $1 copiado a $2"
