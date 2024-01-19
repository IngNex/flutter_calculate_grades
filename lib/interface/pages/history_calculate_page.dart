import 'package:flutter/material.dart';

class HistoryCalculateScreen extends StatefulWidget {
  @override
  _HistoryCalculateState createState() => _HistoryCalculateState();
}

class _HistoryCalculateState extends State<HistoryCalculateScreen> {
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController p3Controller = TextEditingController();
  TextEditingController p4Controller = TextEditingController();
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();

  List<Map<String, double>> historicalEntries = [];

  double calculateFinalGrade() {
    double p1 = double.tryParse(p1Controller.text) ?? 0.0;
    double p2 = double.tryParse(p2Controller.text) ?? 0.0;
    double p3 = double.tryParse(p3Controller.text) ?? 0.0;
    double p4 = double.tryParse(p4Controller.text) ?? 0.0;
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;

    double finalGrade = ((p1 + p2 + p3 + p4) / 4 * 0.4) + (nota1 * 0.3) + (nota2 * 0.3);

    // Agregar todas las notas al historial
    // Agregar todas las notas al historial
    setState(() {
      historicalEntries.add({
        'P1': p1,
        'P2': p2,
        'P3': p3,
        'P4': p4,
        'Nota1': nota1,
        'Nota2': nota2,
        'NotaFinal': finalGrade,
      });
    });

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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: historicalEntries.length,
                itemBuilder: (context, index) {
                  final entry = historicalEntries[index];
                  final entryString =
                      entry.entries.map((e) => '${e.key}: ${e.value}').join(', ');
                  return ListTile(
                    title: Text('Historial ${index + 1}: $entryString'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}