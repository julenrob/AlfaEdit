#!/bin/bash
clear

read -p "Seleccione fecha del Backup: " carpeta

FuncionNrobotCorto () {
	robotCorto=($(grep -E "^MH*" $(ls $(pwd)'/'$carpeta'/'*.zip) | gawk -F "/" '{print $8}' | gawk -F "MH31_" '{print $3}' | gawk -F "_12" '{print $1}' | gawk -F "_14" '{print $1}'))
	#echo 
	#echo todos los robotCorto ${robotCorto[*]}
	#echo "Nombre corto robot1: ${robotCorto[0]}"
	#echo "Nombre corto robot2: ${robotCorto[1]}"
	#echo "Nombre corto robot3: ${robotCorto[2]}"
	#echo "Nombre corto robot4: ${robotCorto[3]}"
	#echo "Nombre corto robot5: ${robotCorto[4]}"
	#echo "Nombre corto robot6: ${robotCorto[5]}"
	#echo "Nombre corto robot7: ${robotCorto[6]}"
	#echo "Nombre corto robot8: ${robotCorto[7]}"
	#echo "Nombre corto robot9: ${robotCorto[8]}"
	#echo "Nombre corto robot10: ${robotCorto[9]}"
	#echo "Nombre corto robot11: ${robotCorto[10]}"
	#echo "Nombre corto robot12: ${robotCorto[11]}"
	#echo "Nombre corto robot13: ${robotCorto[12]}"
}

FuncionNrobotCorto

FuncionTOOL_NAME () {
countTyB2=0
for P in "${robotCorto[@]}"
do
lineasCONFIG=($(grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9]),]\=\"\S" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB2]}/KRC/R1/System/\$config.dat))

	lineasNUM=0
	for R in "${lineasCONFIG[@]}"
	do
	
	TOOL_NAME=($(grep -E "^TOOL_NAME\[${lineasCONFIG[$lineasNUM]},]\=\"\S" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB2]}/KRC/R1/System/\$config.dat))
	echo "--"
	echo "$lineasNUM"
	echo $R
	echo "--"
	((lineasNUM++));

	((countTyB2++));
	done
done
}


FuncionTOOL_NAME

exit 0

	countTyB=0	
	for D in "${robotCorto[@]}"
	do
	#grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9])," $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ------------------------------------------------------------------------------------------------------------------------
	echo ${robotCorto[$countTyB]}
	#-- TOOL_NAME --

	grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9]),]\=\"\S" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	
	echo ----

	((countTyB++));
	done