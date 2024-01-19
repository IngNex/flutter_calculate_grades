import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
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

    double finalGrade = ((p1 + p2 + p3 + p4) / 4 * 0.4) + (nota1 * 0.3) + (nota2 * 0.3);
    return finalGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Nota Final'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: p1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'P1'),
            ),
            TextField(
              controller: p2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'P2'),
            ),
            TextField(
              controller: p3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'P3'),
            ),
            TextField(
              controller: p4Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'P4'),
            ),
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 1'),
            ),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double finalGrade = calculateFinalGrade();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Nota Final'),
                    content: Text('La nota final es: $finalGrade'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Calcular Nota Final'),
            ),
          ],
        ),
      ),
    );
  }
}