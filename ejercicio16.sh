#!/bin/bash

# Suma con for
SUMA=0
for i in {1..1000}; do
    SUMA=$((SUMA + i))
done
echo "Suma con for: $SUMA"

# Suma con while
SUMA=0
i=1
while [ $i -le 1000 ]; do
    SUMA=$((SUMA + i))
    i=$((i + 1))
done
echo "Suma con while: $SUMA"

# Suma con until
SUMA=0
i=1
until [ $i -gt 1000 ]; do
    SUMA=$((SUMA + i))
    i=$((i + 1))
done
echo "Suma con until: $SUMA"
