#!/bin/bash
ARCHIVO="lista.txt"

while true; do
    echo "AGENDA - Selecciona una opción:"
    echo "1) Añadir"
    echo "2) Buscar"
    echo "3) Listar"
    echo "4) Ordenar"
    echo "5) Borrar"
    echo "6) Salir"

    read -p "Opción (1-6): " OPCION

    case $OPCION in
        1)
            # Añadir un registro
            read -p "Nombre: " NOMBRE
            read -p "Dirección: " DIRECCION
            read -p "Teléfono: " TELEFONO
            echo "$NOMBRE, $DIRECCION, $TELEFONO" >> "$ARCHIVO"
            echo "Registro añadido."
            ;;
        2)
            # Buscar entradas
            read -p "Introduce palabra a buscar: " BUSCAR
            grep -i "$BUSCAR" "$ARCHIVO"
            ;;
        3)
            # Listar todo
            cat "$ARCHIVO"
            ;;
        4)
            # Ordenar alfabéticamente
            sort "$ARCHIVO" -o "$ARCHIVO"
            echo "Archivo ordenado."
            ;;
        5)
            # Borrar archivo
            rm -f "$ARCHIVO"
            echo "Archivo borrado."
            ;;
    esac


done
