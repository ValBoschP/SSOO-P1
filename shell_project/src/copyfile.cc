/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Sistemas Operativos
 * Curso: 2º
 * Práctica 2: Copyfile
 * @autor: Valeria Bosch Pérez (alu0101485287@ull.edu.es)
 * @date: 29 Nov 2022
 * @file: copyfile.cc
 * @brief: copyfile functions
 * Referencias:
 * Enlaces de interés
 * Historial de revisiones
 * 29/11/2022 - Creación (primera versión) del código
 *  - Continuación del código
 *  - Finalización del código
 */
#include <iostream>

#include "copyfile.h"
#include "scope_exit.h"

std::vector<uint8_t> ReadFile(const int file_descriptor) {
  try {
    std::vector<uint8_t> buffer(16ul * 1024 * 1024);
    ssize_t bytes_read = read(file_descriptor, buffer.data(), buffer.size());
    if (bytes_read < 0) {
      throw std::system_error(errno, std::system_category());
    }
    buffer.resize(bytes_read);
    return buffer;
  } catch (const std::exception& error) {
    std::cerr << "Error reading the file!" << std::endl;
    throw error;
  }
}

std::vector<uint8_t> WriteFile(int file_descriptor, std::vector<uint8_t> buffer) {
  try {
    write(file_descriptor, buffer.data(), buffer.size());
  } catch (const std::exception& error) {
    std::cerr << "Error writing the file!" << std::endl;
    throw error;
  }
}

void CopyFile(const std::string& source_path, const std::string& destination_path, bool preserve_all = false) {
  try {

    struct stat source_stat{};
    stat(source_path.c_str(), &source_stat);
    if (stat(source_path.c_str(), &source_stat) == -1) {
      throw std::runtime_error("The source file does not exist!");
    }
    if (!S_ISREG(source_stat.st_mode)) {
      throw std::runtime_error("The sourcefile is not a regular file!");
    }

    std::string destination_copy = destination_path;
    char* c_destination_path = const_cast<char*>(destination_path.c_str());
    std::string dst_dir_path = dirname(c_destination_path);
    struct stat dst_dir_stat{};
    if (stat(destination_path.c_str(), &dst_dir_stat) == -1) {
      throw std::runtime_error("Destination path does not exist!");
    }

    struct stat dst_path_stat{};
    destination_copy = destination_path;
    stat(destination_copy.c_str(), &dst_path_stat);

    if (source_stat.st_dev == dst_path_stat.st_dev && source_stat.st_ino == dst_path_stat.st_ino) {
      std::stringstream error;
      error << "'" << source_path << "' and '" << destination_path << "' are the same file!";
      throw std::runtime_error(error.str());
    }

    if (S_ISDIR(dst_path_stat.st_mode)) {
      std::string source_copy = source_path;
      char* c_source_path = const_cast<char*>(source_path.c_str());
      std::string file_name = basename(c_source_path);
      destination_copy += "/" + file_name;
    }

    int source_fd = open(source_path.c_str(), O_RDONLY);
    auto close_source = ScopeExit([source_fd]{
      close(source_fd);
    });
    if (source_fd < 0) {
      throw std::system_error(errno, std::system_category());
    }

    int destination_fd = open(destination_path.c_str(), O_RDONLY);
    auto close_destination = ScopeExit([destination_fd]{
      close(destination_fd);
    });
    if (destination_fd < 0) {
      throw std::system_error(errno, std::system_category());
    }

    while (true) {
      std::vector<uint8_t> buffer = ReadFile(source_fd);
      if (buffer.empty()) break;
      WriteFile(destination_fd, buffer);
    }

  } catch (const std::exception& error) {
    std::cerr << "Error copying file!" << std::endl;
    throw error;
  }
}

void MoveFile(const std::string& source_path, const std::string& destiny_path) {
  std::cout << "Working on it..." << std::endl;
}