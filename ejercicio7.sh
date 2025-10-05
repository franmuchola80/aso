#!/bin/bash
# Guardar el primer parámetro como nombre del directorio
DIR=$1

# Guardar la fecha actual en formato yyyy-mm-dd
FECHA=$(date +%F)

# Crear un archivo tar comprimido con gzip con nombre fecha_directorio.tar.gz
tar -czf "${FECHA}_${DIR}.tar.gz" "$DIR"

# Mostrar mensaje de confirmación
echo "Archivo ${FECHA}_${DIR}.tar.gz creado."
