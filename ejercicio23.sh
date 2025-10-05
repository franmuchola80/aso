#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

# Comprobar que el directorio existe
if [ ! -d "$directorio" ]; then
    echo "Error: $directorio no es un directorio válido"
    exit 1
fi

contador=0

# Listado no recursivo
for entrada in "$directorio"; do
    if [ -d "$entrada" ]; then
        echo "$entrada es un directorio"
    elif [ -f "$entrada" ]; then
        echo "$entrada es un fichero"
    elif [ -L "$entrada" ]; then
        echo "$entrada es un enlace simbólico"
    elif [ -b "$entrada" ]; then
        echo "$entrada es un archivo especial de bloque"
    elif [ -c "$entrada" ]; then
        echo "$entrada es un archivo especial de caracter"
    else
        echo "$entrada es otro tipo de entrada"
    fi

done


