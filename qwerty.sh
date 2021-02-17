#!/bin/bash
clear
count=1



IFS=$'\n'
LineasMovimiento=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $1,$2,$3,$4,$5}'))
#1. PTP o LIN
LineasMovimiento_TipoMovimiento=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $1}'))
#2. LHP, home, ubergabe, etc...
LineasMovimiento_NombrePunto=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $2}'))
#3. C_PTP=CONT y sino no es CONT
LineasMovimiento_Continuo=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $3}'))
#5. Vel= (Velocidad) 100 o 0.2 etc...
LineasMovimiento_Velocidad=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $4}'))
#7. PDAT, PDATHH, LDAT, LDATH, DEFAULT PARA HOME Y UBERGABES
LineasMovimiento_PDAT=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F '%P' '{print $2}' | gawk -F ' ' '{print $5}'))
#Tool
LineasMovimiento_Tool=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | grep -E "Tool*"))
#Base
LineasMovimiento_Base=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | grep -E "Base*"))


## IMPORTANTE ##

LHP_Correctas="^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]"
LHP_Incorrectas="^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9])"

KLB_Correctas="LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])"
KLB_Incorrectas="LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9][0|5]"

FZR_Correctas='^\;FOLD (PTP|LIN) LFZR243X1_[1-9]\_[0-9][0-9][0|5]'
FZR_Incorrectas='^\;FOLD (PTP|LIN) LFZR243X1_[1-9]\_[0-9][0-9]([1-4]|[6-9])'

CL_Todas='^\;FOLD (PTP|LIN) LCL_243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'

PR_Correctas='^\;FOLD (PTP|LIN) LPR_243X[0-9][0-9][0-9]\_[0-9][0-9][0|5]'
PR_Incorrectas='^\;FOLD (PTP|LIN) LPR_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])'

BH_Correctas='^\;FOLD (PTP|LIN) LBH_243X[0-9][0-9][0-9]\_[0-9][0-9][0|5]'
BH_Incorrectas='^\;FOLD (PTP|LIN) LBH_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])'

BA_Correctas='^\;FOLD (PTP|LIN) LBA_243X[0-9][0-9][0-9]\_[0-9][0-9][0|5]'
BA_Incorrectas='^\;FOLD (PTP|LIN) LBA_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])'

LBRST_Correctas='^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9][0|5]'
LBRST_Incorrectas='^\;FOLD (PTP|LIN) LBRST\_[0-9][0-9]([1-4]|[6-9])'

L_BHF_VP_Correctas='^\;FOLD (PTP|LIN) L_BHF_VP[0-9][0-9][0|5]'
L_BHF_VP_Incorrectas='^\;FOLD (PTP|LIN) L_BHF_VP[0-9][0-9]([1-4]|[6-9])'

L_BHF_NP_Correctas='^\;FOLD (PTP|LIN) L_BHF_NP[0-9][0-9][0|5]'
L_BHF_NP_Incorrectas='^\;FOLD (PTP|LIN) L_BHF_NP[0-9][0-9]([1-4]|[6-9])'

L_BHF_DOCK_Todas='^\;FOLD (PTP|LIN) L_BHF_DOCK'

BN_Correctas='^\;FOLD (PTP|LIN) BN\_[0-9][0-9][0-9]\_[0-9][0-9][0|5]'
BN_Incorrectas='^\;FOLD (PTP|LIN) BN\_[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])'




BV_Todas='^\;FOLD (PTP|LIN) VorzeigePos'
H_Todas='^\;FOLD (PTP|LIN) HOME'
H5_Todas='^\;FOLD (PTP|LIN) HOME5'
War_Todas='^\;FOLD (PTP|LIN) Maintenance'
Ref_Todas='^\;FOLD (PTP|LIN) RefPos'
Targ_Todas='^\;FOLD (PTP|LIN) Target_Check'


## CÓMO APARECEN LOS TEXTOS LARGOS POR DEFECTO
#EN ALEMÁN:		SPS -> KRC4, Reserve
# EN INGLÉS:	



MOSTRAR LINEAS CORRECTAS LHP
# grep -E -r --with-filename "^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5] *" $(pwd)/2020.08.03/Extraido/030RB_100/KRC/R1/

MOSTRAR LINEAS INCORRECTAS LHP
# grep -E -r --with-filename "^\;FOLD (PTP|LIN) LHP[0-9][0-9]([1-4]|[6-9]) *" $(pwd)/2020.08.03/Extraido/030RB_100/KRC/R1/

MOSTRAR LINEAS INCORRECTAS DE MASILLA
# grep -E -r --with-filename '^\;FOLD (PTP|LIN) LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/2020.08.03/Extraido/

MOSTRAR LINEAS INCORRECTAS DE LHP Y MASILLA
# grep -E -r --with-filename '^\;FOLD (PTP|LIN) (LHP[0-9][0-9]([1-4]|[6-9])|LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9]))' $(pwd)/2020.08.03/Extraido/

MOSTRAR LINEAS INCORRECTAS DE LHP, MASILLA Y Rollfalzen
# grep -E -r --with-filename '^\;FOLD (PTP|LIN) (LHP[0-9][0-9]([1-4]|[6-9])|LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|LFZR243X1_[1-9]\_[0-9][0-9]([1-4]|[6-9]))' $(pwd)/2020.08.03/Extraido/

MOSTRAR LINEAS DE LHP(INCORRECTAS), MASILLA(INCORRECTAS), Rollfalzen(INCORRECTAS) Y CLINCHEN(TODAS)
# grep -E -r --with-filename '^\;FOLD (PTP|LIN) (LHP[0-9][0-9]([1-4]|[6-9])|LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|LFZR243X1_[1-9]\_[0-9][0-9]([1-4]|[6-9])|LCL_243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])' $(pwd)/2020.08.03/Extraido/


MOSTRAR LINEAS DE LHP(INCORRECTAS), MASILLA(INCORRECTAS), Rollfalzen(INCORRECTAS), CLINCHEN(TODAS) Y PRAEGEN(INCORRECTAS)

# grep -E -r --with-filename '^\;FOLD (PTP|LIN) (LHP[0-9][0-9]([1-4]|[6-9])|LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|LFZR243X1_[1-9]\_[0-9][0-9]([1-4]|[6-9])|LCL_243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]|LPR_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])' $(pwd)/2020.08.03/Extraido/
# grep -E -r --with-filename '^\;FOLD (PTP|LIN) (LHP[0-9][0-9]([1-4]|[6-9])|LKLB243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9])|LFZR243X1_[1-9]\_[0-9][0-9]([1-4]|[6-9])|LCL_243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]|LPR_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9]))' $(pwd)/2020.08.03/Extraido/

LCL_243X[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
LPR_243X[0-9][0-9][0-9]\_[0-9][0-9]([1-4]|[6-9]

Lineas_Movimiento_Nombre_Punto=($(grep -E "^\;FOLD (PTP|LIN) * " /mnt/r/2020/Hambach_Mercedes/Backups/2020.07.24/Extraido/030RB_100/KRC/R1/Program/Handling/X243/bh_030r1_010_x243_01.src | gawk -F ' ' '{print $3}'))


for Y in "${Lineas_Movimiento[@]}"
do
	echo ""
	echo $Y
done
unset IFS