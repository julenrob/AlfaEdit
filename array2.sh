#!/bin/bash
clear

#read -p "Selecciona: " opcionales
LScontent=($(ls))
	echo 
	echo "Todos los elementos de la carpeta: ${LScontent[*]}"
	#echo "Nombre largo robot1: ${LScontent[0]}"

	case $LScontent in 
	
	## EXPORTAR RDCs ##
	1) echo "${LScontent[0]}"
	#	
	#	echo "Carpeta RDCs creada dentro de Extraido"
	;;