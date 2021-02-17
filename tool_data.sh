#!/bin/bash
clear

#FuncionToolData () {
	#ToolData=($(grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=\{" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat))
	#echo 
	#echo Todos los elementos son de robotLARGO: ${ToolData[*]}
	#echo


#ToolData=($(grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat))
#echoToolData=($(echo $ToolData))
#grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=\{" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat
#grep -v "^TOOL_DATA\[([1-9]|[1-9][0-9])]\={X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0}" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat
#echo ToolData= $echoToolData
#echo ------
#grep -v "^TOOL_DATA\[([1-9]|[1-9][0-9])]\={X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0}" $echoToolData
#echo ------


#FuncionToolData () {
	#ToolData=($(grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat))
	#echo +++
	#echo "Todos los elementos de ToolData: ${ToolData[*]}"
	#echo 1. ${ToolData[1]}
	
#}
#FuncionToolData
IFS=$'\n'
#grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\={X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0}" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat
ToolData=($(grep -E "^TOOL_DATA\[([1-9]|[1-9][0-9])]\=*" $(pwd)/2020.06.10/Extraido/030RB_100/KRC/R1/System/\$config.dat))
echo $ToolData


SubFuncion_MostrarToolesYBases () {
	countTyB=0	
	for D in "${ToolData[@]}"
	do
	#grep -E "^TOOL_NAME\[([1-9]|[1-9][0-9])," $(pwd)/$carpeta/Extraido/${robotCorto[$countTyB]}/KRC/R1/System/\$config.dat
	echo ------------------------------------------------------------------------------------------------------------------------
	echo $countTyB

	if [ $D == "TOOL_DATA[([1-9]|[1-9][0-9])]={X 0.0,Y 0.0,Z 0.0,A 0.0,B 0.0,C 0.0}" ]; then
		echo --------------------------------------------------------------
		echo  $D
		echo --------------------------------------------------------------
	else
		echo "NO!!!"
	fi
	
	((countTyB++));
	done
	
}

SubFuncion_MostrarToolesYBases