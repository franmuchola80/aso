#!/bin/bash

n=$1
if [ "$n" -le 1 ]; then
  echo "No es primo"
  exit
fi

for ((i=2; i*i<=n; i++)); do
  if [ $((n % i)) -eq 0 ]; then
    echo "No es primo"
    exit
  fi
done

echo "Es primo"
