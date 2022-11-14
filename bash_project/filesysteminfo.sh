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

# stat -c %t /dev/sda3  -> numero mayor
# stat -c %T /dev/sda3  -> numero menor

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

SystemInfo() {
  SORT_PARAMS=""
  if [ $invert ]; then
    SORT_PARAMS="r"
  fi
  TABLE="$(df -aT 2> /dev/null | tail -n+2 | sort -k4,2 | awk '{ print $1, $2, $4, $7 }')"
  FINAL_TABLE=""
  PREVIOUS_TYPE=""
  USAGE_SUM=0
  OLD_IFS="${IFS}"
  IFS=$'\n'
  for line in $TABLE; do
    IFS=$' ' read -a LINE <<< "${line}"
    if [[ "${PREVIOUS_TYPE}" != "${LINE[1]}" ]]; then
      if [[ "${PREVIOUS_TYPE}" ]]; then
        FINAL_TABLE="${FINAL_TABLE}${FS_NAME} ${FS_TYPE} ${COUNT} ${USAGE_SUM} ${FS_HIGH} ${FS_LOW} ${FS_MOUNT}\n"
      fi
      COUNT=1
      PREVIOUS_TYPE="${LINE[1]}"
      USAGE_SUM="${LINE[2]}"
      FS_NAME="${LINE[0]}"
      FS_TYPE="${LINE[1]}"
      FS_MOUNT="${LINE[3]}"
      FS_HIGH=$(ls -l ${FS_NAME} 2> /dev/null | cut -d" " -f5 | tr -d "," | tr -d "\n")
      FS_LOW=$(ls -l ${FS_NAME} 2> /dev/null | cut -d" " -f6)
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
  echo -e "NAME TYPE COUNT USAGE HIGH LOW MOUNT\n" "${FINAL_TABLE}" | column -t
}

# cuts & xargs

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
    # MODIFIACION AÑADIDA
    -op | --output-percent)
      SystemInfo $1
      exit 0
      ;;
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
