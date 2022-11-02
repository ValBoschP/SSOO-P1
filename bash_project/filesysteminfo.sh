#!/bin/bash

# filesysteminfo -  Bash Project script

## Constantes
  TITLE=""

## Estilos
  BOLD_TEXT=$(tput bold)
  ULINE_TEXT=$(tput smul)

## Colores
  RED_TEXT=$(tput setaf 1)
  GREEN_TEXT=$(tput setaf 2)
  YELLOW_TEXT=$(tput setaf 3)
  BLUE_TEXT=$(tput setaf 4)
  MAGENTA_TEXT=$(tput setaf 5)

## Reset Text
  RESET_TEXT=$(tput sgr0)

## Funciones

SystemInfo() {
  echo "${ULINE_TEXT}${BOLD_TEXT}${MAGENTA_TEXT}Sistemas de archivos${RESET_TEXT}"
  
}

