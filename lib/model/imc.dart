import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  double _altura;
  double _peso;
  double _imc;

  Imc(this._altura, this._peso, this._imc);

  String get id => _id;
  double get altura => _altura;
  double get peso => _peso;
  double get imc => _imc;

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set imc(double imc) {
    _imc = imc;
  }

  double calcularImc() {
    return peso / (altura * altura);
  }
}
