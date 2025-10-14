#!/bin/bash

# Archivo de salida
SALIDA="archivos_peligrosos.txt"



echo "🔍 Buscando archivos con permisos de escritura para cualquier usuario..."

# Buscar archivos con permisos de escritura para cualquier usuario
find . -type f -perm -0002 -exec realpath {} \; > "$SALIDA"

echo " Lista guardada en $SALIDA"
