#!/bin/bash

echo "Últimos usuarios con dirección IP:"
last | egrep "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"
