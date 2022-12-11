/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Sistemas Operativos
 * Curso: 2º
 * Práctica 2: Copyfile
 * @autor: Valeria Bosch Pérez (alu0101485287@ull.edu.es)
 * @date: 29 Nov 2022
 * @file: copyfile.h
 * @brief: copyfile functions
 * Referencias:
 * Enlaces de interés
 * Historial de revisiones
 * 29/11/2022 - Creación (primera versión) del código
 *  - Continuación del código
 *  - Finalización del código
 */
#ifndef COPYFILE_H
#define COPYFILE_H

#include <system_error>
#include <string>
#include <vector>
#include <fcntl.h>
#include <exception>
#include <stdexcept>
#include <sys/stat.h>
#include <unistd.h>
#include <libgen.h>
#include <sstream>

std::vector<uint8_t> ReadFile(int file_descriptor, std::vector<uint8_t>& buffer);
std::vector<uint8_t> WriteFile(int file_descriptor, std::vector<uint8_t> buffer);
void CopyFile(const std::string& source_path, const std::string& destination_path, bool preserve_all = false);
void MoveFile(const std::string& source_path, const std::string& destination_path);

#endif