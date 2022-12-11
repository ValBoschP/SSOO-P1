/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Sistemas Operativos
 * Curso: 2º
 * Práctica 2: Copyfile
 * @autor: Valeria Bosch Pérez (alu0101485287@ull.edu.es)
 * @date: 29 Nov 2022
 * @file: usages.cc
 * @brief: usages functions
 * Referencias:
 * Enlaces de interés
 * Historial de revisiones
 * 29/11/2022 - Creación (primera versión) del código
 *  - Continuación del código
 *  - Finalización del código
 */

#include "usages.h"
#include "copyfile.h"

const std::string kTitle = 
  "╔══════════════════╗\n\
║ Copyfile Program ║\n\
╚══════════════════╝";
const std::string kHelpText =
 "• How to use: [parameters] ./copyfile source/path destiny/path\n\
 » Parameters:\n\
    -m: The file will be moved not copied.\n\
    -a: Copies the attributes of the original file.";
const std::string kParameters = {"-m", "-a"};
/**
 * @brief: Explains how to use the program
 * @param[in]: argc | argv
 * @return: none
 */
void Usage(int argc, char* argv[]) {
  const std::string kHelp{"--help"};
  if (argc == 1) {
    std::cerr << argv[0] << std::endl << kTitle << std::endl;
    std::cerr << "► How to use: " << argv[0]
              << "[parameters] source/path destiny/path"
              << std::endl;
    std::cerr << "☺ Try " << argv[0] << " --help for more information."
              << std::endl;
    exit(EXIT_FAILURE);
  }
  if (argv[1] == kHelp) {
    std::cout << kTitle << std::endl;
    std::cout << kHelpText << std::endl;
    exit(EXIT_SUCCESS);
  }
}

/**
 * @brief: Runs the program
 * @param[in]: argc | argv
 * @return: none
 */
void Program(int argc, char* argv[]) {
  std::string src_path = argv[2];
  std::string dest_path = argv[3];
  bool preserve_all = false;
  if (argv[1] == "-m") {
    MoveFile(src_path, dest_path);
  } else if (argv[1] == "-a") {
    preserve_all = true;
    CopyFile(src_path, dest_path, preserve_all);
  } else {
    CopyFile(src_path, dest_path, preserve_all);
  }
}