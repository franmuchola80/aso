#!/bin/bash
# Fichero donde se guardará el listado
FICHERO=listado_etc.txt

# Guardar el listado de /etc en el fichero
ls -l /etc > "$FICHERO"

# Mostrar por pantalla el contenido del fichero
echo "Listado de /etc:"
cat "$FICHERO"

# Mostrar el número de lineas
LINEAS=$(wc -l < "$FICHERO")
echo "Número de líneas: $LINEAS"

# Mostramos el número de palabras 
PALABRAS=$(wc -w < "$FICHERO")
echo "Número de palabras: $PALABRAS"

