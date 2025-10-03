#!/bin/bash
# Fichero donde se guardará el listado
FICHERO=listado_etc.txt

# Guardar /etc en el fichero
ls -l /etc > "$FICHERO"

# Mostrar por pantalla
cat "$FICHERO"
