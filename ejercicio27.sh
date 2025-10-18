#!/bin/bash
ARCHIVO="agenda.csv"

validar_telefono() {
    [[ $1 =~ ^[0-9]{9}$ ]]   
}

validar_email() {
    [[ $1 =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
}


añadir_contacto() {
    read -p "Nombre: " NOMBRE
    read -p "Teléfono (9 dígitos): " TELEFONO
    read -p "Email: " EMAIL

    if ! validar_telefono "$TELEFONO"; then
        echo "Teléfono no válido. Debe contener 9 dígitos."
        return
    fi

    if ! validar_email "$EMAIL"; then
        echo " Email no válido."
        return
    fi

    echo "$NOMBRE;$TELEFONO;$EMAIL" >> "$ARCHIVO"
    echo "Contacto añadido correctamente."
}

listar_contactos() {
    if [[ ! -f "$ARCHIVO" ]]; then
        echo " No hay contactos guardados."
        return
    fi
    echo "------ LISTA DE CONTACTOS ------"
    column -t -s ";" "$ARCHIVO"
}

buscar_contacto() {
    read -p "Introduce nombre, teléfono o email a buscar: " BUSCAR
    RESULTADO=$(grep -i "$BUSCAR" "$ARCHIVO" 2>/dev/null)
    if [[ -z "$RESULTADO" ]]; then
        echo " No se encontraron coincidencias."
    else
        echo "------ RESULTADOS ------"
        echo "$RESULTADO" | column -t -s ";"
    fi
}

borrar_contacto() {
    read -p "Introduce el nombre exacto del contacto a borrar: " NOMBRE
    if grep -iq "^$NOMBRE;" "$ARCHIVO"; then
        grep -iv "^$NOMBRE;" "$ARCHIVO" > temp && mv temp "$ARCHIVO"
        echo " Contacto eliminado."
    else
        echo " Contacto no encontrado."
    fi
}

editar_contacto() {
    read -p "Introduce el nombre exacto del contacto a editar: " NOMBRE
    if ! grep -iq "^$NOMBRE;" "$ARCHIVO"; then
        echo " Contacto no encontrado."
        return
    fi

    LINEA=$(grep -i "^$NOMBRE;" "$ARCHIVO")
    OLD_TEL=$(echo "$LINEA" | cut -d ";" -f2)
    OLD_EMAIL=$(echo "$LINEA" | cut -d ";" -f3)

    echo "Datos actuales:"
    echo "Teléfono: $OLD_TEL"
    echo "Email: $OLD_EMAIL"

    read -p "Nuevo teléfono (ENTER para mantener): " NUEVO_TEL
    read -p "Nuevo email (ENTER para mantener): " NUEVO_EMAIL

    [[ -z "$NUEVO_TEL" ]] && NUEVO_TEL="$OLD_TEL"
    [[ -z "$NUEVO_EMAIL" ]] && NUEVO_EMAIL="$OLD_EMAIL"

    if ! validar_telefono "$NUEVO_TEL"; then
        echo " Teléfono no válido."
        return
    fi
    if ! validar_email "$NUEVO_EMAIL"; then
        echo " Email no válido."
        return
    fi

    # Actualizar
    grep -iv "^$NOMBRE;" "$ARCHIVO" > temp
    echo "$NOMBRE;$NUEVO_TEL;$NUEVO_EMAIL" >> temp
    mv temp "$ARCHIVO"

    echo " Contacto actualizado correctamente."
}

imprimir_menu() {
    echo
    echo "========= AGENDA ========="
    echo "1) Añadir contacto"
    echo "2) Listar contactos"
    echo "3) Buscar contacto"
    echo "4) Borrar contacto"
    echo "5) Editar contacto"
    echo "6) Salir"
    echo "=========================="
}


while true; do
    imprimir_menu
    read -p "Elige una opción (1-6): " OPCION
    case $OPCION in
        1) añadir_contacto ;;
        2) listar_contactos ;;
        3) buscar_contacto ;;
        4) borrar_contacto ;;
        5) editar_contacto ;;
        6) echo "👋 Saliendo..."; exit 0 ;;
        *) echo "Opción no válida." ;;
    esac
done
