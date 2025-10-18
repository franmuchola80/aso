#!/bin/bash
# Obtener IP local
obtener_ip_local() {
    IP_LOCAL=$(hostname -I | awk '{print $1}')
    echo "$IP_LOCAL"
}

# prefijo de la red
obtener_prefijo_ip() {
    local ip=$1
    # Extrae los 3 primeros octetos
    PREFIJO=$(echo "$ip" | cut -d '.' -f1-3)
    echo "$PREFIJO"
}

# información de la red

informacion_red() {
    IP_LOCAL=$(obtener_ip_local)
    INTERFAZ=$(ip route | grep "$IP_LOCAL" | awk '{print $3}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    MASCARA=$(ip -o -f inet addr show "$INTERFAZ" | awk '{print $4}')
    BROADCAST=$(ip -o -f inet addr show "$INTERFAZ" | awk '{print $6}')
    RED=$(obtener_prefijo_ip "$IP_LOCAL").0

    echo "----- INFORME DE RED -----"
    echo "Nombre de la red: $RED"
    echo "IP local: $IP_LOCAL"
    echo "Broadcast: $BROADCAST"
    echo "Máscara de subred: $MASCARA"
    echo "Puerta de enlace: $GATEWAY"
    echo "--------------------------"
}


# IPs en la red

comprobar_ip_red() {
    PREFIJO=$(obtener_prefijo_ip "$(obtener_ip_local)")
    echo "Comprobando IPs en la red $PREFIJO.0/24..."
    for i in $(seq 1 254); do
        IP="$PREFIJO.$i"
        ping -c 1 -W 1 "$IP" &> /dev/null
        if [ $? -eq 0 ]; then
            echo "$IP → OCUPADA"
        else
            echo "$IP → LIBRE"
        fi
    done
}


# Menú 

while true; do
    echo
    echo "========= MENU ========="
    echo "1) Mostrar información de la red"
    echo "2) Comprobar IPs libres/ocupadas"
    echo "3) Salir"
    echo "========================"
    read -p "Elige una opción (1-3): " OPCION

    case $OPCION in
        1) informacion_red ;;
        2) comprobar_ip_red ;;
        3) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción no válida" ;;
    esac
done
