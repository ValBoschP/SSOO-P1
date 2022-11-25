#!/bin/bash

# filesysteminfo -  Bash Project script

## Constants
  TITLE="-- System Archives Information --"
  RIGHT_NOW=$(date +"%x %r%Z")
  TIME_STAMP="Actualizada el $RIGHT_NOW por $USER"

## Styles
  BOLD_TEXT=$(tput bold)
  ULINE_TEXT=$(tput smul)

## Colors
  RED_TEXT=$(tput setaf 1)
  GREEN_TEXT=$(tput setaf 2)
  YELLOW_TEXT=$(tput setaf 3)
  BLUE_TEXT=$(tput setaf 4)
  MAGENTA_TEXT=$(tput setaf 5)

## Reset Text
  RESET_TEXT=$(tput sgr0)

## Functions

# Usage: Function that shows how to use the program.

function Usage() {
  echo "${BOLD_TEXT}${MAGENTA_TEXT}$TITLE${RESET_TEXT}"
  echo "${BOLD_TEXT}Script that displays mounted files system information${RESET_TEXT}"
  echo "${BOLD_TEXT}${GREEN_TEXT}How to use:${RESET_TEXT} ./filesysteminfo [parameters]"
  echo "${BOLD_TEXT}${ULINE_TEXT}${BLUE_TEXT}Parameters:${RESET_TEXT}"
  echo "-h | --help : Shows how to use the program."
  echo "-inv : Inverts the output command."
}

# SystemInfo: Function that shows the types of file systems that are mounted on the system

#
SystemInfo() {
  SORT_PARAMS=""          # Declaro una variable para ordenar la tabla al final
  if [ $invert ]; then    
    SORT_PARAMS="r"       # Si invert se cumple pues pondrá r (para inversa) en la tabla final
  fi
  # Calculamos la tabla original con las columnas requeridas
  TABLE="$(df -aT 2> /dev/null | tail -n+2 | sort -k4,2 | awk '{ print $1, $2, $4, $7 }')"
  # Declaramos una "Tabla final" para imprimirla al final una vez calculada la suma del usage
  FINAL_TABLE=""
  # Declaramos una variable para guardar los tipos anteriores
  PREVIOUS_TYPE=""
  USAGE_SUM=0
  OLD_IFS="${IFS}"
  IFS=$'\n'
  for line in $TABLE; do
    # Lee cada una de las líneas en la tabla para poder calcular todo lo que necesitamos
    IFS=$' ' read -a LINE <<< "${line}"
    if [[ "${PREVIOUS_TYPE}" != "${LINE[1]}" ]]; then
      if [[ "${PREVIOUS_TYPE}" ]]; then
        FINAL_TABLE="${FINAL_TABLE} ${FS_NAME} ${FS_TYPE} ${COUNT} ${USAGE_SUM} ${FS_HIGH} ${FS_LOW} ${FS_MOUNT}\n"
      fi
      COUNT=1
      PREVIOUS_TYPE="${LINE[1]}"
      USAGE_SUM="${LINE[2]}"
      # Todas las variables de cada columna
      FS_NAME="${LINE[0]}"
      FS_TYPE="${LINE[1]}"
      FS_MOUNT="${LINE[3]}"
      FS_HIGH=$(ls -l ${FS_NAME} 2> /dev/null | cut -d" " -f5 | tr -d "," | tr -d "\n")
      FS_LOW=$(ls -l ${FS_NAME} 2> /dev/null | cut -d" " -f6)
      # Si no se encuentra el valor mayor o menor, ponemos *
      if [[ ! "${FS_HIGH}" ]]; then
        FS_HIGH="*"
        FS_LOW="*"
      fi
    else
      COUNT=$((${COUNT} + 1))
      USAGE_SUM=$((${USAGE_SUM} + ${LINE[2]}))
    fi
  done
  IFS="${OLD_IFS}"
  FINAL_TABLE=$(echo -e "${FINAL_TABLE}" | sort -k1 -${SORT_PARAMS})
  # Imprimimos nuestra tabla final resultante
  echo -e "${BOLD_TEXT}${ULINE_TEXT}${MAGENTA_TEXT}NAME TYPE COUNT USAGE HIGH LOW MOUNT\n"${RESET_TEXT} "${FINAL_TABLE}" | column -t
}

# MAIN PROGRAM
while [ "$1" != "" ]; do
  case "$1" in
    -h | --help)
      Usage
      exit 0
      ;;
    -inv)
      invert=1
      ;;
    #-devicefiles)
    #  devfiles=1
    #  ;;
    *)
    cat << _EOF_
      ${BOLD_TEXT}${RED_TEXT}ERROR: Invalid option! :(${RESET_TEXT}
_EOF_
    Usage
    exit 1
    ;;
  esac
  shift
done

SystemInfo

exit 0

# CONSUMIENDO_USUARIO=0
# USUARIOS=
# 