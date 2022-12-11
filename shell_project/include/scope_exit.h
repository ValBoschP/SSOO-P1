/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Asignatura: Sistemas Operativos
 * Curso: 2º
 * Práctica 2: Copyfile
 * @autor: Valeria Bosch Pérez (alu0101485287@ull.edu.es)
 * @date: 29 Nov 2022
 * @file: scope_exit.h
 * @brief: scope_exit class
 * Referencias:
 * Enlaces de interés
 * Historial de revisiones
 * 29/11/2022 - Creación (primera versión) del código
 *  - Continuación del código
 *  - Finalización del código
 */

#include <functional>

class ScopeExit {
 public:
  explicit ScopeExit(const std::function<void()>& scope_exit) : scope_exit_(scope_exit) { }
  ~ScopeExit() {
    scope_exit_();
  }
 private:
  std::function<void()> scope_exit_;
};