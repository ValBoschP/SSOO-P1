#!/bin/bash

# filesysteminfo -  Bash Project script

## Constants
  TITLE="-- System Files Information --"
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
  echo "-inv | --invert : Inverts the output command."
  echo "-df | --devicefiles : Open files"
  echo "-u | -user : Open files of each user"
  echo "-sopen | --sortopen : "
  echo "-sdevice | --sortdevice : "
}

error_exit() {
  echo "${BOLD_TEXT}${RED_TEXT}ERROR: $1"
  exit 1
}
# SystemInfo: Function that shows the types of file systems that are mounted on the system
SystemInfo() {
  SORT_PARAMS=""          # Declaro una variable para ordenar la tabla al final
  if [ $invert ]; then    
    SORT_PARAMS="r"       # Si invert se cumple pues pondrá r (para inversa) en la tabla fina
  fi
  TABLE="$(df -aT 2> /dev/null | tail -n+2 | sort -k4,2 | awk '{ print $1, $2, $4, $7 }')"
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
        if [[ ${devfiles} ]]; then
          FINAL_TABLE="${FINAL_TABLE}${FS_NAME} ${FS_TYPE} ${COUNT} ${OPENED} ${USAGE_SUM} ${FS_HIGH} ${FS_LOW} ${FS_MOUNT}\n"
        else
          FINAL_TABLE="${FINAL_TABLE}${FS_NAME} ${FS_TYPE} ${COUNT} ${USAGE_SUM} ${FS_HIGH} ${FS_LOW} ${FS_MOUNT}\n"
        fi
      fi
      COUNT=1
      PREVIOUS_TYPE="${LINE[1]}"
      USAGE_SUM="${LINE[2]}"
      # Todas las variables de cada columna
      FS_NAME="${LINE[0]}"
      FS_TYPE="${LINE[1]}"
      FS_MOUNT="${LINE[3]}"
      if [[ ${user_param} ]]; then
        for user in $USERS; do
          CURRENT_OPENED=$(lsof -u ${user} 2> /dev/null | wc -l)
          OPENED=$(( ${OPENED} + ${CURRENT_OPENED} ))
        done
      else
        OPENED=$(lsof ${FS_NAME} 2> /dev/null | wc -l)
      fi
      FS_HIGH=$(stat ${FS_NAME} -c %t 2> /dev/null | cut -d" " -f5 | tr -d "," | tr -d "\n")
      FS_LOW=$(stat ${FS_NAME} -c %T 2> /dev/null | cut -d" " -f6)
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
  if [[ $sort_open ]]; then
    FINAL_TABLE=$(echo -e "${FINAL_TABLE}" | sort -k4 -${SORT_PARAMS})
  elif [[ $sort_device ]]; then
    FINAL_TABLE=$(echo -e "${FINAL_TABLE}" | sort -k3 -n -${SORT_PARAMS})
  else
    FINAL_TABLE=$(echo -e "${FINAL_TABLE}" | sort -k2 -${SORT_PARAMS})
  fi
  HEADING="NAME TYPE COUNT USAGE HIGH LOW MOUNT\n"
  if [[ ${devfiles} ]]; then
    HEADING="NAME TYPE COUNT OPENED USAGE HIGH LOW MOUNT\n"
  fi
  # Imprimimos nuestra tabla final resultante
  echo -e "${BOLD_TEXT}${ULINE_TEXT}${MAGENTA_TEXT}${HEADING}${RESET_TEXT}" "${FINAL_TABLE}" | column -t
}

# MAIN PROGRAM
while [[ $1 != "" ]]; do
  case "$1" in
    -h | --help)
      Usage
      exit 0
      ;;
    --invert | -inv)
      invert=1
      ;;
    -devicefiles | -df)
      devfiles=1
      ;;
    --sortopen | -sopen)
      sort_open=1
      ;;
    --sortdevice | -sdevice)
      sort_device=1
      ;;
    --user | -u)
      USERS=""
      devfiles=1
      user_param=1
      shift
      while [[ "${1:0:1}" != "-" && $1 != "" ]]; do
        USERS="${USERS} $1"
        shift
      done
      DONT_SHIFT=1
      ;;
    *)
    cat << _EOF_
      ${BOLD_TEXT}${RED_TEXT}ERROR: Invalid option! :(${RESET_TEXT}
_EOF_
    Usage
    exit 1
    ;;
  esac
  if [[ ${DONT_SHIFT} == "1" ]]; then
    DONT_SHIFT=""
    continue
  fi
  shift
done
if [[ ${devfiles} != "1" && ${sort_open} == "1" ]]; then
  error_exit "-sopen must be with -devicefiles"
fi
if [[ ${sort_open} == "1" && ${sort_device} == "1" ]]; then
  error_exit "-sopen can't be with -sdevice"
fi
SystemInfo

exit 0