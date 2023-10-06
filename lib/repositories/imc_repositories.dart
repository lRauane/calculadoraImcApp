import 'package:calculadoraimc/model/imc.dart';

class ImcRepository {
  final List<Imc> imcs = <Imc>[];

  calcularIMC(double peso, double altura) {
    return (peso / (altura * altura));
  }

  add(double altura, double peso, double imc) {
    var valor = Imc(altura, peso, imc);
    imcs.add(valor);
  }

  String classificacao(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      return "Saudavel";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II (severa)";
    } else if (imc >= 40) {
      return "Obesidade Grau III (mórbida)";
    }
    return "";
  }
}
