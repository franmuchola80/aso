#!/bin/bash

# Comprobar que hay al menos 4 argumentos
if [ $# -lt 4 ]; then
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

ACCION=$1
NOMBRE=$2
APELLIDO1=$3
APELLIDO2=$4
GRUPO=$5

# Generar identificativo aluXXYYZ
ID="alu${APELLIDO1:0:2}${APELLIDO2:0:2}${NOMBRE:0:1}"

case $ACCION in
    alta)
        # Si no se indica grupo, usar el mismo que el identificativo
        if [ -z "$GRUPO" ]; then
            GRUPO="$ID"
            # Crear grupo
            sudo groupadd "$GRUPO" 2>/dev/null
        fi

        # Crear usuario con home y grupo
        sudo useradd -m -g "$GRUPO" "$ID"
        echo "Usuario $ID creado en grupo $GRUPO"
        ;;
    baja)
        # Dar de baja el usuario y su home
        sudo userdel -r "$ID"
        echo "Usuario $ID eliminado"
        ;;
    *)
        echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac
