import 'package:calculadoraimc/model/imc.dart';
import 'package:calculadoraimc/repositories/imc_repositories.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  var imcRepository = ImcRepository();
  final alturaControler = TextEditingController();
  final pesoControler = TextEditingController();
  List<Imc> imcdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alturaControler.text = "";
          pesoControler.text = "";

          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Calcular IMC"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: alturaControler,
                        decoration:
                            const InputDecoration(labelText: 'Altura (cm)'),
                      ),
                      TextField(
                        controller: pesoControler,
                        decoration: InputDecoration(labelText: 'Peso (kg)'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                        )),
                    TextButton(
                        onPressed: () async {
                          double altura =
                              double.tryParse(alturaControler.text) ?? 0.0;
                          double peso =
                              double.tryParse(pesoControler.text) ?? 0.0;
                          double imc = imcRepository.calcularIMC(peso, altura);

                          setState(() {
                            imcRepository.add(altura, peso, imc);
                          });

                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Salvar",
                        ))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: imcRepository.imcs.isEmpty
            ? Center(
                child: Text(
                  "Para começar o cálculo de IMC, clique no botão abaixo",
                  textAlign: TextAlign.center,
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: imcRepository.imcs.length,
                  itemBuilder: (context, index) {
                    Imc imc = imcRepository.imcs[index];

                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                              'Altura: ${imc.altura} cm, Peso: ${imc.peso} kg'),
                          subtitle: Text(
                              'IMC: ${imc.imc.toStringAsFixed(2)}, Classificação: ${imcRepository.classificacao(imc.imc)}'),
                        ),
                        const Divider(
                          color: Color(0xff141414), // Cor do Divider
                          thickness: 1.0, // Espessura do Divider
                        ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
