#!/bin/bash
# Obtener la hora actual en formato 24h
HORA=$(date +%H)

# Comprobar rango de horas y mostrar el mensaje correspondiente
if [ "$HORA" -ge 8 ] && [ "$HORA" -lt 15 ]; then
    echo "Buenos días"
elif [ "$HORA" -ge 15 ] && [ "$HORA" -lt 20 ]; then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi
