#!/bin/bash

echo "Listando dispositivos conectados..."

lsblk -dn -o NAME,SIZE,MOUNTPOINT,MAJ:MIN | while read line; do
    nombre=$(echo $line | awk '{print $1}')
    # bytes:
    tamano=$(lsblk -b -dn -o SIZE /dev/$nombre) 
    # tamaño:
    tamano_humano=$(echo $line | awk '{print $2}') 
    punto=$(echo $line | awk '{print $3}')
    numero=$(echo $line | awk '{print $4}')
    descripcion=$(udevadm info --query=all --name=/dev/$nombre | grep "ID_MODEL=" | cut -d= -f2)

    # datos:
    echo "Nombre: $nombre"
    echo "Descripción: ${descripcion:-Desconocido}"
    echo "Punto de montaje: ${punto:-No montado}"
    echo "Tamaño: $tamano_humano ($tamano bytes)"
    echo "Número del dispositivo: $numero"
    echo "---"
done