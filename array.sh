#!/bin/bash
clear

read -p "Seleccione fecha del Backup: " carpeta

FuncionNrobotLargo () {
	robotLARGO=($(ls $(pwd)'/'$carpeta'/'*.zip))
	echo 
	echo Todos los elementos son de robotLARGO: ${robotLARGO[*]}
	echo "Nombre largo robot1: ${robotLARGO[0]}"
	echo "Nombre largo robot2: ${robotLARGO[1]}"
	echo "Nombre largo robot3: ${robotLARGO[2]}"
	echo "Nombre largo robot4: ${robotLARGO[3]}"
	echo "Nombre largo robot5: ${robotLARGO[4]}"
	echo "Nombre largo robot6: ${robotLARGO[5]}"
	echo "Nombre largo robot7: ${robotLARGO[6]}"
	echo "Nombre largo robot8: ${robotLARGO[7]}"
	echo "Nombre largo robot9: ${robotLARGO[8]}"
	echo "Nombre largo robot10: ${robotLARGO[9]}"
	echo "Nombre largo robot11: ${robotLARGO[10]}"
	echo "Nombre largo robot12: ${robotLARGO[11]}"
	echo "Nombre largo robot13: ${robotLARGO[12]}"
}

FuncionNrobotCorto () {
robotCorto=($(grep -E "^MH*" $(ls $(pwd)'/'$carpeta'/'*.zip) | gawk -F "/" '{print $8}' | gawk -F "MH31_" '{print $3}' | gawk -F "_12" '{print $1}' | gawk -F "_14" '{print $1}'))
echo 
echo todos los robotCorto ${robotCorto[*]}
echo "Nombre corto robot1: ${robotCorto[0]}"
echo "Nombre corto robot2: ${robotCorto[1]}"
echo "Nombre corto robot3: ${robotCorto[2]}"
echo "Nombre corto robot4: ${robotCorto[3]}"
echo "Nombre corto robot5: ${robotCorto[4]}"
echo "Nombre corto robot6: ${robotCorto[5]}"
echo "Nombre corto robot7: ${robotCorto[6]}"
echo "Nombre corto robot8: ${robotCorto[7]}"
echo "Nombre corto robot9: ${robotCorto[8]}"
echo "Nombre corto robot10: ${robotCorto[9]}"
echo "Nombre corto robot11: ${robotCorto[10]}"
echo "Nombre corto robot12: ${robotCorto[11]}"
echo "Nombre corto robot13: ${robotCorto[12]}"
}

FuncionNrobotLargo
FuncionNrobotCorto

count=0
for a in "${robotLARGO[@]}"
do
		unzip $a -d $(pwd)'/'$carpeta'/'Extraido'/'${robotCorto[$count]};
		((count++));
done

echo
echo "END"