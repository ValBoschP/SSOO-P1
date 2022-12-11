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
/**
 * @brief: Explains how to use the program
 * @param[in]: argc | argv
 * @return: none
 */
void Usage(const int argc, const char* argv[]) {
  try {
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
  } catch (const std::exception& error) {
    std::cerr << "Something went wrong!" << std:: endl;
    throw error;
  }
}
/**
 * @brief: Runs the program
 * @param[in]: argc | argv
 * @return: none
 */
void Program(const int argc, const char* argv[]) {
  std::string src_path = argv[1];
  std::string dest_path = argv[2];
  bool preserve_all = false;
  CopyFile(src_path, dest_path, preserve_all);
}