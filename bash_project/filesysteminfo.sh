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

## Varibles


## Functions

# Usage: Function that shows how to use the program.

function Usage() {
  echo "${BOLD_TEXT}${MAGENTA_TEXT}$TITLE${RESET_TEXT}"
  echo "${BOLD_TEXT}Script that displays mounted files system information${RESET_TEXT}"
  echo "${BOLD_TEXT}${GREEN_TEXT}How to use:${RESET_TEXT} ./filesysteminfo [parameters]"
  echo "${BOLD_TEXT}${ULINE_TEXT}${BLUE_TEXT}Parameter:${RESET_TEXT}"
  echo "-h | --help : Shows how to use the program."
  echo "-inv : Inverts the output command."
}

# SystemInfo: Function that shows the types of file systems that are mounted on the system

SystemInfo() {
  if [ $# == 0 ]; then
    #echo ${BOLD_TEXT}"File" ${RESET_TEXT}
    for device in $(mount | cut -d ' ' -f 5 | sort | uniq); do
      df -aT | grep -w $device | sort -k4 -n | head -n +1 | awk '{print $1"\t" $2"\t" $4"\t" $7"\t"}'
    done | column -t
  
  elif [ $1 == "-inv" ]; then
    for device in $(mount | cut -d ' ' -f 5 | sort -r | uniq); do
      df -aT | grep -w $device | sort -k4 -nr | head -n +1 | awk '{print $1"\t" $2"\t" $4"\t" $7"\t"'
    done | column -t
  fi
}

# MAIN PROGRAM
while [ "$1" != "" ]; do
  case "$1" in
    -h | --help)
      Usage
      exit 0
      ;;
    -inv)
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
