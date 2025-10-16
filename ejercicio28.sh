#!/bin/bash

# Compruebar si existe el fichero
existe() {
    local fichero="$1"   # Parámetro de la función
    if [ -f "$fichero" ]; then
        echo "El fichero '$fichero' existe."
        # Cambiar permisos: solo propietario puede ejecutar
        chmod u+x,g=,o= "$fichero"
        echo "Permisos cambiados a ejecutable solo para el propietario."
    else
        echo "El fichero '$fichero' NO existe."
    fi
}

# Comprobación de parámetros
if [ $# -ne 1 ]; then
    echo "Uso: $0 nombre_del_fichero"
    exit 1
fi

# Llamada a la función pasando el parámetro
existe "$1"
