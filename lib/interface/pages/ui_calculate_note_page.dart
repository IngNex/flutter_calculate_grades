import 'package:calcular_notas/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class DesingCalculateScreen extends StatefulWidget {
  const DesingCalculateScreen({super.key});

  @override
  _DesingCalculateScreenState createState() => _DesingCalculateScreenState();
}

class _DesingCalculateScreenState extends State<DesingCalculateScreen> {
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController p3Controller = TextEditingController();
  TextEditingController p4Controller = TextEditingController();
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();

  double calculateFinalGrade() {
    double p1 = double.tryParse(p1Controller.text) ?? 0.0;
    double p2 = double.tryParse(p2Controller.text) ?? 0.0;
    double p3 = double.tryParse(p3Controller.text) ?? 0.0;
    double p4 = double.tryParse(p4Controller.text) ?? 0.0;
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;

    double finalGrade =
        ((p1 + p2 + p3 + p4) / 4 * 0.4) + (nota1 * 0.3) + (nota2 * 0.3);
    return finalGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Nota Final'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  child:
                      CustomTextField(p1Controller: p1Controller, label: 'P1'),
                ),
                Flexible(
                  child:
                      CustomTextField(p1Controller: p2Controller, label: 'P2'),
                ),
                Flexible(
                  child:
                      CustomTextField(p1Controller: p3Controller, label: 'P3'),
                ),
                Flexible(
                  child:  CustomTextField(p1Controller: p4Controller, label: 'P4'),
                ),
                Flexible(
                  child:  CustomTextField(p1Controller: nota1Controller, label: 'N1')
                ),
                Flexible(
                  child:  CustomTextField(p1Controller: nota2Controller, label: 'N2'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double finalGrade = calculateFinalGrade();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Nota Final'),
                    content: Text('La nota final es: $finalGrade'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Calcular Nota Final'),
            ),
          ],
        ),
      ),
    );
  }
}
