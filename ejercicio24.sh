#!/bin/bash

# Comprobar que se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

# Comprobar que existe y es un directorio
if [ ! -d "$directorio" ]; then
    echo "Error: $directorio no es un directorio válido"
    exit 1
fi

# Contadores
ficheros=0
subdirectorios=0

# Recorremos las entradas del directorio (no recursivo)
for entrada in "$directorio"/*; do
    if [ -f "$entrada" ]; then
        ficheros=$((ficheros + 1))
    elif [ -d "$entrada" ]; then
        subdirectorios=$((subdirectorios + 1))
    fi
done

echo "Número de ficheros: $ficheros"
echo "Número de subdirectorios: $subdirectorios"


