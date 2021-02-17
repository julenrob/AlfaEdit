#!/bin/bash
clear

AE="/mnt/r/2020/Hambach_Mercedes/Backups/2020.08.05/Extraido/040RB_100/KRC/R1/Program/Clinchen/X243/cl_040r1_040_x243.src"
#LHP_Correctas_String="\;FOLD \(PTP\|LIN\) LHP\[0\-9\]\[0\-9\]\[0\|5\]"
LHP_Correctas_String="^\;FOLD (PTP|LIN) LHP[0-9][0-9][0|5]"
#LHP_Correctas_String="\;FOLD (PTP\|LIN) LHP[0\-9][0\-9][0\|5]"

grep -E "$LHP_Correctas_String" "$AE"