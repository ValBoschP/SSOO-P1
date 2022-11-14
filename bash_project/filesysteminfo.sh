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

