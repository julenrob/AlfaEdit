#!/bin/bash
clear
echo "Extraer los ubergabes que se utilizan y sus valores (por terminal, no exportar un archivo)"
echo ""

## SE?AL PARA QUE LA EXPORTACI?N DE DATOS SEA DESDE TODOS LOS ROBOTS Y NO DE SubFuncion_BusquedaConfig | RESET INICIAL | ##
signal_01=0
## SE?ALES PARA MOSTRAR Programas distintos dentro de /KRC/R1/Program/ $KRC_R1_Program_Diferentes SOLO UNA VEZ, PARA LAS 5 OPCIONES QUE HAY##
signal_03=0
signal_04=0
signal_05=0
signal_06=0
signal_07=0
countLS_Backups=0

NameLinea=MH31
year=2020
Proyecto=Hambach_Mercedes

#FUNCIONA
FuncionLSBackups () {
lsBackups=($(ls '/'mnt'/'r'/'$year'/'$Proyecto'/'Backups))
	
for W in "${lsBackups[@]}"
do
	if [[ $W == $year* ]]; then
				
		echo $W
		echo ""			
		((countLS_Backups++));
		
	fi
			
done
}

FuncionLSBackups

read -p "Seleccione fecha del Backup: " carpeta

#FUNCIONA
FuncionNrobotLargo () {
	robotLARGO=($(ls $(pwd)'/'$carpeta'/'*.zip))
	#echo 
	#echo Todos los elementos son de robotLARGO: ${robotLARGO[*]}
	#echo "Nombre largo robot1: ${robotLARGO[0]}"
	#echo "Nombre largo robot2: ${robotLARGO[1]}"
	#echo "Nombre largo robot3: ${robotLARGO[2]}"
	#echo "Nombre largo robot4: ${robotLARGO[3]}"
	#echo "Nombre largo robot5: ${robotLARGO[4]}"
	#echo "Nombre largo robot6: ${robotLARGO[5]}"
	#echo "Nombre largo robot7: ${robotLARGO[6]}"
	#echo "Nombre largo robot8: ${robotLARGO[7]}"
	#echo "Nombre largo robot9: ${robotLARGO[8]}"
	#echo "Nombre largo robot10: ${robotLARGO[9]}"
	#echo "Nombre largo robot11: ${robotLARGO[10]}"
	#echo "Nombre largo robot12: ${robotLARGO[11]}"
	#echo "Nombre largo robot13: ${robotLARGO[12]}"
}

#FUNCIONA
FuncionNrobotCorto () {
	############################################################################################################################## gawk -F "_12" '{print $1}' SON LOS 2 PRIMEROS NUMEROS DE LOS 6 ULTIMOS NUMEROS DEL BACKUP
	#robotCorto=($(grep -E "^MH*" $(ls $(pwd)'/'$carpeta'/'*.zip) | gawk -F "/" '{print $8}' | gawk -F $NameLinea"_" '{print $3}' | gawk -F "_12" '{print $1}' | gawk -F "_14" '{print $1}'))
	robotCorto=($(grep -E "^($(echo $NameLinea))*" $(ls $(pwd)'/'$carpeta'/'*.zip) | gawk -F "/" '{print $8}' | gawk -F $NameLinea"_" '{print $3}' | gawk -F "_12" '{print $1}' | gawk -F "_14" '{print $1}'))
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

FuncionNrobotLargo > /dev/null
FuncionNrobotCorto > /dev/null

#FUNCIONA
SubFuncion_Descomprimir () {	
	####################### CREANDO CARPETA Y DESCOMPRIMIENDO #######################
	sleep 1
	mkdir $carpeta'/'Extraido
	echo Creando carpeta Extraido dentro de $carpeta
	sleep 1
	echo ------------------------------------------------------------------------------------------------------------------
	echo 
	echo Descomprimiendo carpetas...
	sleep 1
	
	count=0
	for a in "${robotLARGO[@]}"
	do
		unzip $a -d $(pwd)'/'$carpeta'/'Extraido'/'${robotCorto[$count]};
		((count++));
	done
	
	echo 
	echo 
	echo Proceso completado.
	echo 
	echo 
}

#FUNCIONA
SubFuncion_ExportarRDCs () {
if [ -d $(pwd)'/'$carpeta/Extraido/RDCs ];then 
	echo "Error al extraer los RDCs, la carpeta RDCs ya existe"
	exit 1
else	
	mkdir $carpeta'/'Extraido/RDCs
fi		
	countRDC=0	
	for b in "${robotCorto[@]}"
	do
		mkdir $carpeta/Extraido/RDCs/${robotCorto[$countRDC]}
		cp -r $(pwd)/$carpeta/Extraido/${robotCorto[$countRDC]}/C/KRC/Roboter/Rdc $carpeta/Extraido/RDCs/${robotCorto[$countRDC]}
		((countRDC++));
	done		
}

#FUNCIONA
SubFuncion_ExportarProyecto () {

if [ -d $(pwd)'/'$carpeta/Extraido/Proyectos ];then 
	echo "Error al extraer los proyectos, la carpeta Proyectos ya existe"
	exit 1
else
	mkdir $carpeta'/'Extraido/Proyectos
fi		
		countProy=0	
		for c in "${robotCorto[@]}"
		do	
			mkdir $carpeta/Extraido/Proyectos/${robotCorto[$countProy]}
			cp -r $(pwd)/$carpeta/Extraido/${robotCorto[$countProy]}/C/KRC/User/ProjectRoot $carpeta/Extraido/Proyectos/${robotCorto[$countProy]}
			((countProy++));	
		done
		
		echo "Carpeta Proyectos creada dentro de Extraido"
}

#FUNCIONA
SubFuncion_BusquedaConfig () {
	
	countTyB=0
	
	for Q in "${robotCorto[@]}"
	do
		echo $countTyB")" ${robotCorto[$countTyB]}
		((countTyB++));
	done
	#countTyB=0
	
	echo ""
	
	read -p "Robot: " BusquedaConfig_robot
	
	#####################################################################
	
	#casenum=0
	#signal_02=0
	#for R in "${robotCorto[@]}"
	#do
	##	case $BusquedaConfig_robot in
		
	##		$casenum)
	##		for R in "${robotCorto[@]}"
	##		do
	##			countTyB=$BusquedaConfig_robot
	##			echo ${robotCorto[$countTyB]}
			
	##		((casenum++));
	##		done	
			
	##		;;
	##		all)
			#for V in "${robotCorto[@]}"
			#do
				#echo --
	##			signal_02=1
				#countTyB=$(echo ${robotCorto[@]})
				#echo --
			#done
	##		;;
	##	esac
	#((casenum++));
	#done
	
	#####################################################################
	
	echo ""
	echo ${robotCorto[$BusquedaConfig_robot]}
	echo ""
	echo "1) Tooles"
	echo "2) Bases"
	echo ""
	
	read -p "Selecciona: " BusquedaConfig_Tipo
	echo ""
	
echo ${robotCorto[$BusquedaConfig_Tipo]}
	
	case $BusquedaConfig_Tipo in 
	
	1) echo "Tooles"
		read -p "Numero de tool?: " toolnum
		echo ""
		#FUNCIONA
		SubsubFuncion_BusquedaConfig_OutputTOOLS () {	
		
		#SI LA SE?AL signal_02 es 1 quiere decir all)
		if [[ $signal_02 == 1 ]]; then
		
			countTyB=0
			for V in "${robotCorto[@]}" 
			do
				echo ${robotCorto[$BusquedaConfig_robot]}
				echo ---
				grep -E "^TOOL_NAME\["$toolnum",]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				grep -E "^TOOL_DATA\["$toolnum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				grep -E "^TOOL_TYPE\["$toolnum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				echo ---
				grep -E "^LOAD_DATA\["$toolnum"\]\=\{*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				echo ---
				echo ""
				((countTyB++));
			done
		else
		
		#####################################################################
		
			echo ${robotCorto[$BusquedaConfig_robot]}
			echo ---
			grep -E "^TOOL_NAME\["$toolnum",]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			grep -E "^TOOL_DATA\["$toolnum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			grep -E "^TOOL_TYPE\["$toolnum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			echo ---
			grep -E "^LOAD_DATA\["$toolnum"\]\=\{*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			echo ---
		fi
		}
		
		SubsubFuncion_BusquedaConfig_OutputTOOLS
	;;
	
	2) echo "Bases"
		read -p "Numero de base?: " basenum
		#FUNCIONA
		SubsubFuncion_BusquedaConfig_OutputBASES () {	
		
		#SI LA SE?AL signal_02 es 1 quiere decir all)
		if [[  $signal_02 == 1 ]];then
		
			#countTyB=0
			for V in "${robotCorto[@]}" 
			do
				echo ${robotCorto[$BusquedaConfig_robot]}
				echo ---
				grep -E "^BASE_NAME\["$basenum",]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				grep -E "^BASE_DATA\["$basenum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				grep -E "^BASE_TYPE\["$basenum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
				echo ---
				echo ""
			done
		else
		
			echo ${robotCorto[$BusquedaConfig_robot]}
			echo ---
			grep -E "^BASE_NAME\["$basenum",]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			grep -E "^BASE_DATA\["$basenum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			grep -E "^BASE_TYPE\["$basenum"]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/System/\$config.dat
			echo ---
		fi
		}
		SubsubFuncion_BusquedaConfig_OutputBASES
	;;

	esac
	signal_01=0
}

#SIN TERMINAR
SubFuncion_GUEBERGABE () {
	
	countUberg=0
	
	for Q in "${robotCorto[@]}"
	do
		echo $countUberg")" ${robotCorto[$countUberg]}
		((countUberg++));
	done
	
	echo "all) Todos los robots"
	echo ""
	
	read -p "Robot: " BusquedaGUEBERGABE_robot
	
	#####################################################################
	
	casenumUberg=0
	#signal_02=0
	#for R in "${robotCorto[@]}"
	#do
		case $BusquedaGUEBERGABE_robot in
		
			$casenumUberg)
			for R in "${robotCorto[@]}"
			do
				echo ${robotCorto[$countUberg]}
				countUberg=$BusquedaGUEBERGABE_robot
				grep -E "DECL GLOBAL E6AXIS XGUEBERGABE*" $(pwd)/$carpeta/Extraido/${robotCorto[$countUberg]}/KRC/R1/DAI/user_global.dat | grep -v "A1 0.0,A2 0.0,A3 0.0,A4 0.0,A5 0.0,A6 0.0,E1 0.0,E2 0.0,E3 0.0,E4 0.0,E5 0.0,E6 0.0"	
			
				((casenumUberg++));
			done	
			
			;;
			##all)
			#for V in "${robotCorto[@]}"
			#do
				#echo --
				##signal_02=1
				#countTyB=$(echo ${robotCorto[@]})
				#echo --
			#done
			##;;
		esac
	#((casenum++));
	#done
	
	#SI LA SE?AL signal_02 es 1 quiere decir all)
		if [[ $signal_02 == 1 ]]; then
		
			countTyB=0
			for V in "${robotCorto[@]}" 
			do
				echo ${robotCorto[$countTyB]}
				echo ---
				grep -E "^XGUEBERGABE*" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/DAI/\user_global.dat | grep -v "A1 0.0,A2 0.0,A3 0.0,A4 0.0,A5 0.0,A6 0.0,E1 0.0,E2 0.0,E3 0.0,E4 0.0,E5 0.0,E6 0.0"	
				echo ---
				echo ""
				((countTyB++));
			done
		fi
	#####################################################################
	
	
		
	signal_01=0
}

#FUNCIONA
SubFuncion_MostrarToolesYBases () {
	countTyB=0	
	for D in "${robotCorto[@]}"
	do
	#grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9])," $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ------------------------------------------------------------------------------------------------------------------------
	echo ${robotCorto[$countTyB]}
	echo ""
	#-- TOOL_NAME --
	#grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9]),]\=\"\S|^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*|^TOOL_TYPE\[([1-9]|[1-9][0-9])]\=#BASE" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat | grep -v "X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0"
	if [[ $tool_nameYESNO == "yes" ]] || [[ $tool_nameYESNO == "si" ]] || [[ $tool_nameYESNO == "SI" ]] || [[ $tool_nameYESNO == "s" ]] || [[ $tool_nameYESNO == "y" ]] || [[ $tool_nameYESNO == "YES" ]] || [[ $tool_nameYESNO == "Y" ]]; then 
		grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9]),]\=\"\S" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ----
	fi
	#-- TOOL_DATA --
	if [[ $tool_dataYESNO == "yes" ]] || [[ $tool_dataYESNO == "si" ]] || [[ $tool_dataYESNO == "SI" ]] || [[ $tool_dataYESNO == "s" ]] || [[ $tool_dataYESNO == "y" ]] || [[ $tool_dataYESNO == "YES" ]] || [[ $tool_dataYESNO == "Y" ]]; then 
		grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat | grep -v "X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0"	
	echo ----
	fi
	#-- TOOL_TYPE --
	if [[ $tool_typeYESNO == "yes" ]] || [[ $tool_typeYESNO == "si" ]] || [[ $tool_typeYESNO == "SI" ]] || [[ $tool_typeYESNO == "s" ]] || [[ $tool_typeYESNO == "y" ]] || [[ $tool_typeYESNO == "YES" ]] || [[ $tool_typeYESNO == "Y" ]]; then 
		grep -E "^TOOL_TYPE\[([1-9]|[1-9][0-9])]\=#BASE" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ----
	fi
	#-- BASE_NAME --
	#grep -E "^BASE_NAME\[([1-9]|[1-9][0-9]),]\=\"\S|^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*|^TOOL_TYPE\[([1-9]|[1-9][0-9])]\=#BASE" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat | grep -v "X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0"
	if [[ $base_nameYESNO == "yes" ]] || [[ $base_nameYESNO == "si" ]] || [[ $base_nameYESNO == "SI" ]] || [[ $base_nameYESNO == "s" ]] || [[ $base_nameYESNO == "y" ]] || [[ $base_nameYESNO == "YES" ]] || [[ $tool_typeYESNO == "Y" ]]; then 
		grep -E "^BASE_NAME\[([1-9]|[1-9][0-9]),]\=\"\S" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ----
	fi
	#-- BASE_DATA --
	if [[ $base_dataYESNO == "yes" ]] || [[ $base_dataYESNO == "si" ]] || [[ $base_dataYESNO == "SI" ]] || [[ $base_dataYESNO == "s" ]] || [[ $base_dataYESNO == "y" ]] || [[ $base_dataYESNO == "YES" ]] || [[ $base_dataYESNO == "Y" ]]; then
		grep -E "^BASE_DATA\[([1-9]|[1-9][0-9])]\=*" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat | grep -v "X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0"	
	echo ----
	fi
	#-- BASE_TYPE --
	if [[ $base_typeYESNO == "yes" ]] || [[ $base_typeYESNO == "si" ]] || [[ $base_typeYESNO == "SI" ]] || [[ $base_typeYESNO == "s" ]] || [[ $base_typeYESNO == "y" ]] || [[ $base_typeYESNO == "YES" ]] || [[ $base_typeYESNO == "Y" ]]; then
		grep -E "^BASE_TYPE\[([1-9]|[1-9][0-9])]\=#BASE" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ----
	fi
	#-- LOAD_DATA --
	if [[ $load_dataYESNO == "yes" ]] || [[ $load_dataYESNO == "si" ]] || [[ $load_dataYESNO == "SI" ]] || [[ $load_dataYESNO == "s" ]] || [[ $load_dataYESNO == "y" ]] || [[ $load_dataYESNO == "YES" ]] || [[ $load_dataYESNO == "Y" ]]; then
		grep -E "^LOAD_DATA\[([1-9]|[1-9][0-9])\]\=\{" $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat | grep -v "M -1.00000,CM {X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0},J {X 0.0,Y 0.0,Z 0.0}"
	fi
	echo ""
	((countTyB++));
	done
	
	## SE?AL PARA QUE LA EXPORTACI?N DE DATOS SEA DESDE TODOS LOS ROBOTS Y NO DE SubFuncion_BusquedaConfig ##
	signal_01=1
	
	#SubFuncion_MostrarToolesYBases > $(pwd)/$carpeta/Extraido/ConfigExport.txt
	
}

#FUNCIONA
SubFuncion_Checksums () {	

		read -p "Crear Checksums o comparar 2 checksums? " RespuestaChecksumsCrear_comparar
		
		if [[ $RespuestaChecksumsCrear_comparar == "crear" ]] || [[ $RespuestaChecksumsCrear_comparar == "CREAR" ]] ; then
		
			countRobotChecksums=0
			for R in "${robotCorto[@]}"
			do
				echo $countRobotChecksums")" ${robotCorto[$countRobotChecksums]}
				((countRobotChecksums++));
			done
		
			echo "all) Todos los robots"
			echo ""
			
			read -p "Robot: " Checksum_robot
			echo ""
			
			#####################################################################
			
			casenum=0
			DIA=`date +"%d%m%Y"`
			HORA=`date +"%H%M%S"`
			#for S in "${robotCorto[@]}"
			#do
			case $Checksum_robot in
		
				$casenum)
				for S in "${robotCorto[@]}"
				do
					countRobotChecksums=$Checksum_robot	
					find $(pwd)/$carpeta/Extraido/${robotCorto[$countRobotChecksums]} -type f -exec md5sum {} + >> $carpeta/Extraido/Checksum_$carpeta\_${robotCorto[$casenum]}_$HORA\_$DIA.md5
				done	
				;;
				
				all)
				
				if [ -f $(pwd)/$carpeta/Extraido/Checksum\_$NameLinea\_$carpeta.md5 ]; then
					rm -rf $(pwd)'/'$carpeta'/'Extraido'/'Checksum\_$NameLinea\_$carpeta.md5
				fi
				
					countRobotChecksums=0
					for U in "${robotCorto[@]}"
						do 
							#find $(pwd)/$carpeta/Extraido/${robotCorto[$countRobotChecksums]} -type f -exec md5sum {} + > $carpeta/Extraido/Checksum\_$NameLinea\_$carpeta\_$HORA\_$DIA.md5
							find $(pwd)/$carpeta/Extraido/${robotCorto[$countRobotChecksums]} -type f -exec md5sum {} + >> $carpeta/Extraido/Checksum\_$NameLinea\_$carpeta.md5
							((countRobotChecksums++));
							echo "$U --> OK"
						done
					echo ""
					echo "$carpeta/Extraido/Checksum_$carpeta_$NameLinea_$HORA_$DIA.md5 creado"
					
				;;
				
			esac
			((casenum++));
			
		elif [[ $RespuestaChecksumsCrear_comparar == "comparar" ]] || [[ $RespuestaChecksumsCrear_comparar == "COMPARAR" ]]; then
			
			#####################################################################		
			countLS_Backups=0
			for W in "${lsBackups[@]}"
			do
				if [[ $W == $year* ]]; then
				
					echo ""
					echo $W
					
					((countLS_Backups++));
				fi
			
			done
				
					echo ""
					FechaCompararChecksums1=$carpeta
					
					
					read -p "Comparar $FechaCompararChecksums1 con : " FechaCompararChecksums2

					echo ""
					
					#####################################################################
					casenum=0
					
					if [ -d $(pwd)'/'$FechaCompararChecksums1'/'Extraido ] && [ -f $(pwd)'/'$FechaCompararChecksums1'/'Extraido'/'Checksum*\_$NameLinea*.md5 ]; then
						if [ -d $(pwd)'/'$FechaCompararChecksums2'/'Extraido ] && [ -f $(pwd)'/'$FechaCompararChecksums2'/'Extraido'/'Checksum*\_$NameLinea*.md5 ]; then
							rm -rf $(pwd)'/'$FechaCompararChecksums2'/'Extraido'/'ArchivosDistintos.tmp
						IFS=$'\n'
						FuncionHash1 () {
							#Hash1=($(cat $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5 | awk -F ' {2,}' '{print $1}'))
							Hash1=($(gawk -F '  ' '{print $1}' $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5))
							#Hash1_Fichero=($(cat $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5 | awk -F ' {2,}' '{print $2}'))
							Hash1_Fichero=($(gawk -F '  ' '{print $2}' $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5))
							Rutas_Fichero1=($(gawk -F '  ' '{print $2}' $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5 | gawk -F '[0-9][0-9][0-9]RB_[0-9][0-9][0-9]' '{print $2}'))
						}
						
						FuncionHash2 () {
						
							#Hash2=($(cat $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5 | awk -F ' {2,}' '{print $1}'))
							Hash2=($(gawk -F '  ' '{print $1}' $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5))
							#Hash2_Fichero=($(cat $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5 | awk -F ' {2,}' '{print $2}'))
							Hash2_Fichero=($(gawk -F '  ' '{print $2}' $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5))
							Rutas_Fichero2=($(gawk -F '  ' '{print $2}' $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5 | gawk -F '[0-9][0-9][0-9]RB_[0-9][0-9][0-9]' '{print $2}'))
						}
												
						FuncionHash1
						FuncionHash2
						
						unset IFS
						
						countHash=0
						NhashesIguales=0
						NhashesDifierentes=0
						countProgDistinto=1
						
						KRC_R1_Program_Diferentes=0
						KRC_R1_H_Prog_Diferentes=0
						KRC_R1_DAI_Diferentes=0
						KRC_R1_System_Diferentes=0
						KRC_R1_TP_Diferentes=0
						
						
						#IFS=$'\n'
						for Y in "${Hash1[@]}"
						do
						#dirname $Y
								if [[ ${Hash1[$countHash]} == ${Hash2[$countHash]} ]]; then
									echo "-----------------------------------------------------------------------------------------"
									echo "${Hash1_Fichero[$countHash]}"
									echo "y" 
									echo "${Hash2_Fichero[$countHash]} son iguales"
									((NhashesIguales++));
									echo "$NhashesIguales"
									echo "-----------------------------------------------------------------------------------------"

								else

									echo "${Hash2_Fichero[$countHash]}" >> $(pwd)/$FechaCompararChecksums2/Extraido/ArchivosDistintos.tmp
									
									#if [[ $ProgDistinto1 ]]; then
										#ProgDistinto2=${Hash1_Fichero[$countHash]}
									#else
										#ProgDistinto1=${Hash1_Fichero[$countHash]}
									#fi
									
									echo "-----------------------------------------------------------------------------------------"
																		
						##		if [[${Hash1_Fichero[$countHash]} ]]; then
						##			BUSCA LA FORMA DE GUARDAR POR CADA ARCHIVO LA RUTA DE CADA ARCHIVO PARA FILTRAR POR LAS CARPETAS IMPORTANTES, LAS OTRAS NO LO SON TANTO
						##			ESO O BUSQUEDA GLOBAL DE TODOS LOS ARCHIVOS
						##			IF RUTA ES IGUAL A ESTA O ESTA O ESTA ECHO HASHFICHERO 1 Y 2
						##		fi
						##		if [[${Rutas_Fichero1[$countHash]} == ]]; then
									
						##		fi
									if [[ ${Hash2_Fichero[$countHash]} = *'/'KRC'/'R1'/'Program'/'* ]]; then
										echo "${Hash1_Fichero[$countHash]}"
										echo "y"
										echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
										((NhashesDifierentes++));
										echo "$NhashesDifierentes"
										echo "-----------------------------------------------------------------------------------------"
										
										((KRC_R1_Program_Diferentes++));
										fi
										
											if [[ ${Hash2_Fichero[$countHash]} = *'/'KRC'/'R1'/'H_Prog'/'* ]]; then
												echo "${Hash1_Fichero[$countHash]}"
												echo "y"
												echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
												((NhashesDifierentes++));
												echo "$NhashesDifierentes"
												echo "-----------------------------------------------------------------------------------------"
											
												((KRC_R1_H_Prog_Diferentes++));
											fi
												if [[ ${Hash2_Fichero[$countHash]} = *'/'KRC'/'R1'/'DAI'/'* ]]; then
												
													echo "${Hash1_Fichero[$countHash]}"
													echo "y"
													echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
													((NhashesDifierentes++));
													echo "$NhashesDifierentes"
													echo "-----------------------------------------------------------------------------------------"
													((KRC_R1_DAI_Diferentes++));
												fi
													if [[ ${Hash2_Fichero[$countHash]} = *'/'KRC'/'R1'/'System'/'* ]]; then
														echo "${Hash1_Fichero[$countHash]}"
														echo "y"
														echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
														((NhashesDifierentes++));
														echo "$NhashesDifierentes"
														echo "-----------------------------------------------------------------------------------------"
														
														((KRC_R1_System_Diferentes++));
													fi
													
														if [[ ${Hash2_Fichero[$countHash]} = *'/'KRC'/'R1'/'TP'/'* ]]; then
															
															echo "${Hash1_Fichero[$countHash]}"
															echo "y"
															echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
															((NhashesDifierentes++));
															echo "$NhashesDifierentes"
															echo "-----------------------------------------------------------------------------------------"
											
															((KRC_R1_TP_Diferentes++));
														fi

										#echo "${Hash1_Fichero[$countHash]}"
										#echo "y"
										#echo "${Hash2_Fichero[$countHash]} son distintos <--------------------------------------------------------------"
										((NhashesDifierentes++));
										#echo "$NhashesDifierentes"
										#echo "-----------------------------------------------------------------------------------------"
									
									
									

								fi
								((countHash++));
						done
						#unset IFS

						echo "Programas iguales= $NhashesIguales"
						echo "Programas distintos= $NhashesDifierentes"
						
						
						#for Z in "$ProgDistinto[$countProgDistinto]"
						
						#echo "Los programas distintos son: $ProgDistinto[$countProgDistinto]"
						echo ""
						echo "Programas Distintos: "
						
						#cat $(pwd)'/'$FechaCompararChecksums1'/'Extraido'/'ArchivosDistintos.tmp
						
						#lineas_ArchivosDistintos=($(grep * $(pwd)'/'$FechaCompararChecksums1'/'Extraido'/'ArchivosDistintos.tmp | gawk -F '[0-9][0-9][0-9]RB_[0-9][0-9][0-9]' '{print $2}'))
						
						IFS=$'\n'
						lineas_ArchivosDistintos=($(grep -E "^" $(pwd)'/'$FechaCompararChecksums2'/'Extraido'/'ArchivosDistintos.tmp ))
						
						
						for AA in "${lineas_ArchivosDistintos[@]}"
						do
						
							lineasDistintas=($(echo $AA))

							if [[ "$AA" == *'/'KRC'/'R1'/'Program'/'* ]]; then
								
									if [ "$signal_03" = 0 ]; then
										echo ""
										echo -e "Programas distintos dentro de /KRC/R1/Program/ $KRC_R1_Program_Diferentes"
										signal_03=1
									fi
								echo "$AA"
							fi
						done
						for AA in "${lineas_ArchivosDistintos[@]}"
						do
							if [[ "$AA" == *'/'KRC'/'R1'/'H_Prog'/'* ]]; then
									if [ "$signal_04" = 0 ]; then
									echo ""
									echo -e "Programas distintos dentro de /KRC/R1/H_Prog/ $KRC_R1_H_Prog_Diferentes"
									signal_04=1
									fi
								echo "$AA"
							fi
						done
						for AA in "${lineas_ArchivosDistintos[@]}"
						do
							if [[ "$AA" == *'/'KRC'/'R1'/'DAI'/'* ]]; then
									if [ "$signal_05" = 0 ]; then
									echo ""
									echo -e "Programas distintos dentro de /KRC/R1/DAI/ $KRC_R1_DAI_Diferentes"
									signal_05=1
									fi
								echo "$AA"
							fi
						done
						for AA in "${lineas_ArchivosDistintos[@]}"
						do
							if [[ "$AA" == *'/'KRC'/'R1'/'System'/'* ]]; then
									if [ "$signal_06" = 0 ]; then
									echo ""
									echo -e "Programas distintos dentro de /KRC/R1/System/ $KRC_R1_System_Diferentes"
									signal_06=1
									fi
								echo "$AA"
							fi
						done
						for AA in "${lineas_ArchivosDistintos[@]}"
						do
							if [[ "$AA" == *'/'KRC'/'R1'/'TP'/'* ]]; then
									if [ "$signal_07" = 0 ]; then
									echo ""
									echo -e "Programas distintos dentro de /KRC/R1/TP/ $KRC_R1_TP_Diferentes"
									signal_07=1
									fi
								echo "$AA"
							fi
						done
						
						unset IFS
						
						#echo $hash_Checksum1
						#echo $hash_Checksum2
						
						#diff -rq $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5 $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5
						#diff -rq $hash_Checksum1 $hash_Checksum2
					
					else
						echo "$(pwd)/$FechaCompararChecksums1/Extraido no existe o no e ha creado el archivo $(pwd)/$FechaCompararChecksums1/Extraido/Checksum*\_$NameLinea*.md5 por favor, repita el proceso y extraiga los backups de tal fecha"
					fi	
						else
							echo "$(pwd)/$FechaCompararChecksums2/Extraido no existe o no se ha creado el archivo $(pwd)/$FechaCompararChecksums2/Extraido/Checksum*\_$NameLinea*.md5 por favor, repita el proceso y extraiga los backups de tal fecha y cree el Checksum del Backup"
						fi
		
		fi
}	

FuncionCabeceras () {

	countCabeceras=0
	IFS=$'\n'
	for AB in "${robotCorto[@]}"
	do
	#	Cabecera_Anlagenbezeichn=($(grep -r '^\;FOLD \; Anlagenbezeichn\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/ | gawk -F '2\\:' '{print $2}'))	
		Cabecera_Anlagenbezeichn_NombrePrograma=($(grep -r --with-filename '^\;FOLD \; Anlagenbezeichn\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/ | gawk -F ':' '{print $1}'))
	##	echo "Grep"
	##	grep -r --with-filename '^\;FOLD \; Anlagenbezeichn\:' "$(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/" | gawk -F '\\:' '{print $1}'
##	unset IFS
	#	Cabecera_Version=($(grep -r '^\;FOLD \; Stand / Version\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/  | gawk -F '2\\:' '{print $2}'))
	#	Cabecera_Version_NombrePrograma=($(grep -r --with-filename '^\;FOLD \; Stand / Version\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/  | gawk -F '\\:' '{print $1}'))

	#	Cabecera_Bearbeiter=($(grep -r '^\;FOLD \; Name Bearbeiter\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/ | gawk -F '2\\:' '{print $2}'))
	#	Cabecera_Bearbeiter_NombrePrograma=($(grep -r --with-filename '^\;FOLD \; Name Bearbeiter\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/ | gawk -F '\\:' '{print $1}'))
		
		countAnlagenbezeichn_Incorrectos=0
		countVersion_Incorrectos=0
		countBearbeiter_Incorrectos=0	
		
		Cabecera_Anlagenbezeichn_Correcto="MH31    Stations-Nr: $AB"
		Cabecera_Version_Correcto="19.05.2020"
		Cabecera_Bearbeiter_Correcto="InPro Electric GmbH"
		
		
		
		echo ""
		echo $AB
		echo ""
		
		echo "Correcto $Cabecera_Anlagenbezeichn_Correcto" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
		echo "Correcto $Cabecera_Version_Correcto" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
		echo "Correcto $Cabecera_Bearbeiter_Correcto" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
		
		countProgramasCabeceras=0
		
		#Cabecera_Anlagenbezeichn=($(grep -E '^\;FOLD \; Anlagenbezeichn\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Anlagenbezeichn\\: ' '{print $2}'))
		#Cabecera_Version=($(grep -E '^\;FOLD \; Stand / Version\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Stand / Version\\: ' '{print $2}'))
		#Cabecera_Bearbeiter=($(grep -E '^\;FOLD \; Name Bearbeiter\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Name Bearbeiter\\: ' '{print $2}'))
		
		for AC in "${Cabecera_Anlagenbezeichn_NombrePrograma[@]}"
		do
			IFS=$'\n'
			#Cabecera_Anlagenbezeichn_NombrePrograma=($(grep -r --with-filename '^\;FOLD \; Anlagenbezeichn\:' $(pwd)/$carpeta/Extraido/${robotCorto[$countCabeceras]}/KRC/R1/ | gawk -F ':' '{print $1}'))

			echo $AC
			echo "" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
			basename $AC >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
##			IFS=$'\n'
			#Cabecera_Anlagenbezeichn_Correcto="MH31    Stations-Nr: $AB"
			#Cabecera_Version_Correcto="19.05.2020"
			#Cabecera_Bearbeiter_Correcto="InPro Electric GmbH"
			
			Cabecera_Anlagenbezeichn=($(grep -E '^\;FOLD \; Anlagenbezeichn\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2:Anlagenbezeichn: ' '{print $2}'))
		##	echo "Grep"
		##	grep -E '^\;FOLD \; Anlagenbezeichn\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Anlagenbezeichn\\: ' '{print $2}'
			Cabecera_Version=($(grep -E '^\;FOLD \; Stand / Version\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2:Stand / Version: ' '{print $2}'))
		##	echo "Grep"
		##	grep -E '^\;FOLD \; Stand / Version\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Stand / Version\\: ' '{print $2}'
			Cabecera_Bearbeiter=($(grep -E '^\;FOLD \; Name Bearbeiter\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2:Name Bearbeiter: ' '{print $2}'))
		##	echo "Grep"
		##	grep -E '^\;FOLD \; Name Bearbeiter\:' ${Cabecera_Anlagenbezeichn_NombrePrograma[$countProgramasCabeceras]} | gawk -F '2\\:Name Bearbeiter\\: ' '{print $2}'
			
			echo "$Cabecera_Anlagenbezeichn" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
			echo "$Cabecera_Version" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
			echo "$Cabecera_Bearbeiter" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
			
		##	unset IFS
			
###############################################################################################################################################################################################################################
			
			echo "---------------------------------------------------------------------------------------------------"
			echo "Cabecera_Anlagenbezeichn: $Cabecera_Anlagenbezeichn"
			echo "Cabecera_Anlagenbezeichn_Correcto: $Cabecera_Anlagenbezeichn_Correcto"
			
			if [ -n "$Cabecera_Anlagenbezeichn" ]; then
			
			echo "Cabecera_Anlagenbezeichn: $Cabecera_Anlagenbezeichn"
			echo "Cabecera_Anlagenbezeichn_Correcto: $Cabecera_Anlagenbezeichn_Correcto"
				
				if [ "$Cabecera_Anlagenbezeichn" == "$Cabecera_Anlagenbezeichn_Correcto" ]; then
					echo "$Cabecera_Anlagenbezeichn OK"
					unset Cabecera_Anlagenbezeichn
				else
					echo $AC >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					echo "Cabecera_Anlagenbezeichn: $Cabecera_Anlagenbezeichn" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					echo "Cabecera_Anlagenbezeichn_Correcto: $Cabecera_Anlagenbezeichn_Correcto" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					echo "" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					
					echo "Incorrecto ------------> $Cabecera_Anlagenbezeichn"
					((countAnlagenbezeichn_Incorrectos++));
					echo "Este es incorrecto: $Cabecera_Anlagenbezeichn"
					echo "Este es incorrecto: $Cabecera_Anlagenbezeichn_Correcto"
					
					echo "$Cabecera_Anlagenbezeichn Incorrecto $Cabecera_Anlagenbezeichn_NombrePrograma" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					echo "" >> $(pwd)/$carpeta/Extraido/FallosCabeceras\_${robotCorto[$countCabeceras]}.txt
					unset Cabecera_Anlagenbezeichn
				fi
			fi
			
###############################################################################################################################################################################################################################
			
			echo "---------------------------------------------------------------------------------------------------"
			
			echo "Cabecera_Version: $Cabecera_Version"
			echo "Cabecera_Version_Correcto: $Cabecera_Version_Correcto"
			
			if [ -n "$Cabecera_Version" ]; then 
			
			echo "Cabecera_Version: $Cabecera_Version"
			echo "Cabecera_Version_Correcto: $Cabecera_Version_Correcto"
				
				if [ "$Cabecera_Version" == "$Cabecera_Version_Correcto" ]; then
					echo "$Cabecera_Version OK"
					unset Cabecera_Version
				else
					echo $AC
					echo "Cabecera_Version: $Cabecera_Version"
					echo "Cabecera_Version_Correcto: $Cabecera_Version_Correcto"
					echo ""
					
					echo "Incorrecto ------------> $Cabecera_Version"
					((countVersion_Incorrectos++));
					echo "Este es incorrecto: $Cabecera_Version"
					echo "Este es incorrecto: $Cabecera_Version_Correcto"
					unset Cabecera_Version
				fi
			
			fi	
			
###############################################################################################################################################################################################################################
			
			echo "---------------------------------------------------------------------------------------------------"
			
			echo "Cabecera_Bearbeiter: $Cabecera_Bearbeiter"
			echo "Cabecera_Bearbeiter_Correcto: $Cabecera_Bearbeiter_Correcto"
			
			if [ -n "$Cabecera_Bearbeiter" ]; then 
			
			echo "Cabecera_Bearbeiter: $Cabecera_Bearbeiter"
			echo "Cabecera_Bearbeiter_Correcto: $Cabecera_Bearbeiter_Correcto"
				
				if [ "$Cabecera_Bearbeiter" == "$Cabecera_Bearbeiter_Correcto" ]; then
					echo "$Cabecera_Bearbeiter OK"
					unset Cabecera_Bearbeiter
				else
					echo $AC
					echo "Cabecera_Bearbeiter: $Cabecera_Bearbeiter"
					echo "Cabecera_Bearbeiter_Correcto: $Cabecera_Bearbeiter_Correcto"
					echo ""
					
					echo "Incorrecto ------------> $Cabecera_Bearbeiter"
					((countBearbeiter_Incorrectos++));
					echo "Este es incorrecto: $Cabecera_Bearbeiter"
					echo "Este es incorrecto: $Cabecera_Bearbeiter_Correcto"
					unset Cabecera_Bearbeiter
				fi
			
			fi
			
###############################################################################################################################################################################################################################
			
			echo "-------------------------------------------------------------------------------------------------------------------------------"
			
			#echo $Cabecera_Anlagenbezeichn
			#echo $Cabecera_Version
			#echo $Cabecera_Bearbeiter
			
			echo ""	
			((countProgramasCabeceras++));
		unset IFS
		done

		((countCabeceras++));
	done
	
		echo "Cabeceras Anlagenbezeichn incorrectas: $countAnlagenbezeichn_Incorrectos"
		echo "Cabeceras Version incorrectas: $countVersion_Incorrectos"
		echo "Cabeceras Bearbeiter incorrectas: $countBearbeiter_Incorrectos"
		unset IFS
}

SubFuncion_StringsLineasMovimiento () {
	
	IFS=$'\n'
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	Mercedes_tipo="243X"
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	TodasLasStrings_Ruta=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LKLB$(echo Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LKLB$(echo Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LFZR$(echo Mercedes_tipo)1_[1-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LFZR$(echo Mercedes_tipo)1_[1-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LCL_$(echo Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]|^\;FOLD (PTP|LIN) LPR_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LPR_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBH_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBH_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBA_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBA_$(echo Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9]([1-4]|[6-9])' "$(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/" | gawk -F ':;' '{print $1}'))
	TodasLasStrings="^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LKLB($(echo $Mercedes_tipo))[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LKLB($(echo $Mercedes_tipo))[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LFZR($(echo $Mercedes_tipo))1_[1-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LFZR($(echo $Mercedes_tipo))1_[1-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LCL_($(echo $Mercedes_tipo))[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]|^\;FOLD (PTP|LIN) LPR_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LPR_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBH_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBH_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBA_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBA_($(echo $Mercedes_tipo))[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9]([1-4]|[6-9])"
	
	LHP_Correctas_Ruta=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]' "$(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/" | gawk -F ':;' '{print $1}'))
	LHP_Correctas_String="^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]"
	
	LHP_Incorrectas_Ruta=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])' "$(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/" | gawk -F ':;' '{print $1}'))
	LHP_Incorrectas_String="^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])"
	
	LHP_Correctas_Incorrectas_Ruta=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])' "$(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/" | gawk -F ':;' '{print $1}'))
	LHP_Correctas_Incorrectas_String="^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]|^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])"
	
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	KLB_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LKLB$($Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	KLB_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LKLB$($Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
	
	KLB_Correctas_String="^\;FOLD (PTP|LIN) LKLB$(echo Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])"
	KLB_Incorrectas_String="^\;FOLD (PTP|LIN) LKLB$(echo Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9][0|5]"

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	FZR_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LFZR$($Mercedes_tipo)1_[1-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	FZR_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LFZR$($Mercedes_tipo)1_[1-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	CL_Todas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LCL_$($Mercedes_tipo)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	PR_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LPR_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	PR_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LPR_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	BH_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBH_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	BH_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBH_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	BA_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBA_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	BA_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBA_$($Mercedes_tipo)[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	LBRST_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	LBRST_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	L_BHF_VP_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) L_BHF_VP[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	L_BHF_VP_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) L_BHF_VP[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	L_BHF_NP_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) L_BHF_NP[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	L_BHF_NP_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) L_BHF_NP[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	L_BHF_DOCK_Todas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) L_BHF_DOCK' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#	BN_Correctas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) BN\_[0-9][0-9][0-9]\_[0-9][0-9][0|5]' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#	BN_Incorrectas=($(grep -E -r --with-filename '^\;FOLD (PTP|LIN) BN\_[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/$carpeta/Extraido/${robotCorto[$BusquedaConfig_robot]}/KRC/R1/))
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	unset IFS
}

SubFuncion_LineasSinOrden () {
	
	countProgramasLHP=0	
	countTyB=0
	
	for Q in "${robotCorto[@]}"
	do
		echo $countTyB")" ${robotCorto[$countTyB]}
		((countTyB++));
		
	done
	
	echo ""
	
	read -p "Robot: " BusquedaConfig_robot
	
	echo "AQUI PPREGUNTAR CUAL DE TODAS LAS LINEAS QUIERES MOSTRAR, O SI SON TODAS"
	
	SubFuncion_StringsLineasMovimiento
	
	echo ""
	echo ${robotCorto[$BusquedaConfig_robot]}
	echo "Lineas LHP Correctas: "
	
	## TIENES QUE ELIMINAR PRIMERO LOS REPETIDOS Y DESPUES APLICAR EL BUCLE DOBLE, SINO SE VUELVE LOCO ##
		
#	for AF in "${LHP_Correctas_Ruta[@]}"
#	do
#		echo $AF  >> $(pwd)/$carpeta/Extraido/Lineas\_${robotCorto[$BusquedaConfig_robot]}.tmp
#		awk '!visited[$0]++' $(pwd)/$carpeta/Extraido/Lineas\_${robotCorto[$BusquedaConfig_robot]}.tmp > $(pwd)/$carpeta/Extraido/Lineas2\_${robotCorto[$BusquedaConfig_robot]}.tmp

#	done
	
	for AF in "${TodasLasStrings_Ruta[@]}"
	do
		#echo ""
		echo $AF  >> $(pwd)/$carpeta/Extraido/Lineas\_${robotCorto[$BusquedaConfig_robot]}.tmp
		awk '!visited[$0]++' $(pwd)/$carpeta/Extraido/Lineas\_${robotCorto[$BusquedaConfig_robot]}.tmp > $(pwd)/$carpeta/Extraido/Lineas2\_${robotCorto[$BusquedaConfig_robot]}.tmp

	done
	
	
		#IFS=$'\n'
		catLineas2=($(cat $(pwd)/$carpeta/Extraido/Lineas2\_${robotCorto[$BusquedaConfig_robot]}.tmp))
		#unset IFS
		
		countProgramasLHP=0
	for AE in "${catLineas2[@]}"
		do
			
			echo ""
			basename $AE
			#echo ";$AE" | grep -E "$TodasLasStrings" "$AE" | gawk -F ';%' '{print $1}'
			echo "$countProgramasLHP"
	#		IFS=$'\n'
			#echo $LHP_Correctas_String
			StringTodas=($(grep -E "$TodasLasStrings" "$AE" | gawk -F ';%' '{print $1}' | gawk -F ' ' '{print $3}'))
			echo ""
			echo ""
			for AG in "${StringTodas[@]}"
			do	
				#echo "$AG"
				if [[ "$AG" == "LHP[0-9][0-9][[1-4]||[6-9]]" ]]; then
				echo "--"
				echo "$AE"
				echo "LHP Erroneo: $AG"
				echo "--"
				fi
				
				#echo "AG es $AG"
				
			done
			
#			grep -E "$TodasLasStrings" "$AE" | gawk -F ';%' '{print $1}'
#			grep -E "$TodasLasStrings" "$AE" | gawk -F ';%' '{print $1}' | gawk -F ' ' '{print $3}'			
			
			
	#		unset IFS
			((countProgramasLHP++));
		done
		echo "---------------------------------------------------------"
		
		echo "Aqui meter una pregunta de si quieres exportar a un archivo IF EXPORTAR YES THEN EXPORT, ELSE RM folder"
		
		rm -rf $(pwd)/$carpeta/Extraido/Lineas\_${robotCorto[$BusquedaConfig_robot]}.tmp
		rm -rf $(pwd)/$carpeta/Extraido/Lineas2\_${robotCorto[$BusquedaConfig_robot]}.tmp
		
	
	

}

## FUNCIONES Y SUBFUNCIONES QUE ESTAR?N DENTRO DE OP AVANZADAS PROGRAMAR ANTES DE Funcion_Opciones_Avanzadas ##

#FUNCIONA
Funcion_Opciones_Avanzadas () {

	####################### OPCIONES AVANZADAS #######################	
	echo ""
	echo "--------------------- OPCIONES AVANZADAS ---------------------"
	echo "1) Exportar RDCs"
	echo "2) Comprobar programas"
	echo "3) Borrar carpeta Extraido"
	echo "4) Exportar proyectos"
	echo "5) Mostrar Tooles y Bases"
	echo "6) Comparador"
	echo "7) Checksums"
	echo "8) Guebergabes"
	echo "9) Finalizar"
	echo "10) Cabeceras"
	echo "11) Lineas Movimiento"
	echo ""
	
	read -p "Selecciona: " opcionales
	
	case $opcionales in 
	
	## EXPORTAR RDCs ##
	1) echo "Exportar RDCs"
		SubFuncion_ExportarRDCs
		echo "Carpeta RDCs creada dentro de Extraido"
	;;
	
	## COMPROBAR PROGRAMAS ##
	2) echo "Comprobar programas"
		ls $(pwd)'/'$carpeta'/'Extraido'/'"030RB_100"'/'KRC'/'R1'/'Program'/' HP*.src && ls hp*.src
		#if [ -d $(pwd)'/'$carpeta'/'Extraido'/'"030RB_100"'/'KRC'/'R1'/'Program'/'Handling ]
			#030RB100FUNC=GRP
		#fi
	;;
	
	## BORRAR CARPETA EXTRAIDO ##
	3) echo "Borrando carpeta"
		rm -rf $carpeta'/'Extraido
		echo Carpeta Extraido dentro de $carpeta borrada
	;;
	
	## EXPORTAR PROYECTOS ##
	4) echo "Exportando Proyectos"
		SubFuncion_ExportarProyecto
		echo "Carpeta Proyectos dentro de $carpeta creada"
	;;
	
		## MOSTRAR TOOLES Y BASES ##
	5) read -p "Busqueda de un Tool, Base o LOAD_DATA en concreto?(YES/NO): " BusquedaConfigYESNO
	
		if [ $BusquedaConfigYESNO == "yes" ]; then
			SubFuncion_BusquedaConfig
		else
	
		read -p "Mostrar TOOL_NAME ? YES/NO: " tool_nameYESNO
		read -p "Mostrar TOOL_DATA ? YES/NO: " tool_dataYESNO
		read -p "Mostrar TOOL_TYPE ? YES/NO: " tool_typeYESNO
		read -p "Mostrar BASE_NAME ? YES/NO: " base_nameYESNO
		read -p "Mostrar BASE_DATA ? YES/NO: " base_dataYESNO
		read -p "Mostrar BASE_TYPE ? YES/NO: " base_typeYESNO
		read -p "Mostrar LOAD_DATA ? YES/NO: " load_dataYESNO

		SubFuncion_MostrarToolesYBases
		
		fi
				
		read -p "Exportar los datos a un archivo?: " exportarYESNO
		
		if [[ $exportarYESNO == "yes" ]] && [[ $signal_01 = 1 ]]; then
			SubFuncion_MostrarToolesYBases > $(pwd)/$carpeta/Extraido/ConfigExport.txt
			echo "exportando todos"
		fi	
		if [[ $exportarYESNO == "yes" ]] && [[ $signal_01 = 0 ]] && [[ $BusquedaConfig_Tipo = 1 ]]; then 
			SubsubFuncion_BusquedaConfig_OutputTOOLS > $(pwd)/$carpeta/Extraido/Tools_"$carpeta"_ConfigExport.txt
		elif [[ $exportarYESNO == "yes" ]] && [[ $signal_01 = 0 ]] && [[ $BusquedaConfig_Tipo = 2 ]]; then
			SubsubFuncion_BusquedaConfig_OutputBASES > $(pwd)/$carpeta/Extraido/Bases_"$carpeta"_ConfigExport.txt
		fi

		echo "Informacion exportada en $(pwd)/$carpeta/Extraido/ConfigExport.txt"
	;;
	
	6) echo "Comparador"
	read -p "Con que carpeta quieres comparar $carpeta?" carpetaComparada
	
	;;

	## CHECKSUMS ##
	7) echo "Checksums"
	
	SubFuncion_Checksums
			
	;;
	
	## GUEBERGABEs ##
	8) echo "Extraer GUEBERGABEs"
	SubFuncion_GUEBERGABE
	;;
	
	
	## FINALIZAR ##
	9) echo "Finalizar"
		exit 0
	;;
	## CABECERAS ##
	10) echo "Cabeceras"	
	FuncionCabeceras	
	;;
	## LINEAS LHP ##
	11) echo "Lineas LHP"
	SubFuncion_LineasSinOrden
	;;
		
	## ERROR ##
	*) echo "Valor incorrecto"
		exit 1
	;;
	
	esac
}



if [ -d $(pwd)'/'$carpeta'/'Extraido ] && [ ! "$(ls $(pwd)'/'$carpeta'/'Extraido)" ]; then #2> /dev/null
	echo "Carpeta Extraido dentro de $carpeta está vacia"
	read -p "Borrar? (SI/NO): " borrarSINO
	if [ $borrarSINO == "SI" ] || [ $borrarSINO == "si" ] || [ $borrarSINO == "S" ] || [ $borrarSINO == "s" ] || [ $borrarSINO == "Si" ]; then
		rm -rf $carpeta'/'Extraido
		echo Carpeta Extraido dentro de $carpeta borrada
		echo --------------------------------------------------------------
	else
		echo "Finalizar"
		exit 0
	fi
fi
if [ -d $(pwd)'/'$carpeta ] && [ "$(ls $(pwd)'/'$carpeta'/'Extraido)" ]; then
	echo "Carpeta $(pwd)/$carpeta/Extraido localizada."
	Funcion_Opciones_Avanzadas
else
	SubFuncion_Descomprimir
fi

Funcion_Opciones_Avanzadas

echo END
exit 0
