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

void CopyFile(const std::string& source_path, const std::string& destiny_path, bool preserve_all = false);
void MoveFile(const std::string& source_path, const std::string& destiny_path);

#endif