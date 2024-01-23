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

  List<Map<String, double>> historicalEntries = [];

  double calculateFinalGrade() {
    double p1 = double.tryParse(p1Controller.text) ?? 0.0;
    double p2 = double.tryParse(p2Controller.text) ?? 0.0;
    double p3 = double.tryParse(p3Controller.text) ?? 0.0;
    double p4 = double.tryParse(p4Controller.text) ?? 0.0;
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;

    double finalGrade =
        ((p1 + p2 + p3 + p4) / 4 * 0.4) + (nota1 * 0.3) + (nota2 * 0.3);
    finalGrade = (finalGrade * 10.0).round() / 10.0;

    double promedio = (p1 + p2 + p3 + p4) / 4;

    // Agregar todas las notas al historial
    // Agregar todas las notas al historial
    setState(() {
      historicalEntries.add({
        'P1': p1,
        'P2': p2,
        'P3': p3,
        'P4': p4,
        'promedio': promedio,
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
        title: const Text('Calculadora de Nota Final'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  child:
                      CustomTextField(p1Controller: p4Controller, label: 'P4'),
                ),
                Flexible(
                    child: CustomTextField(
                        p1Controller: nota1Controller, label: 'N1')),
                Flexible(
                  child: CustomTextField(
                      p1Controller: nota2Controller, label: 'N2'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateFinalGrade();
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text('Nota Final'),
                //     content: Text('La nota final es: $finalGrade'),
                //     actions: [
                //       TextButton(
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         child: Text('OK'),
                //       ),
                //     ],
                //   ),
                // );
              },
              child: const Text('Calcular Nota Final'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  // Ajusta el espaciado entre columnas según tu preferencia
                  columnSpacing: 15,
                  // Ajusta la altura de las filas según tu preferencia
                  dataRowHeight: 50,
                  // Ajusta la altura de la fila de encabezado según tu preferencia
                  headingRowHeight: 60,
                  columns: const [
                    DataColumn(label: Text('P1')),
                    DataColumn(label: Text('P2')),
                    DataColumn(label: Text('P3')),
                    DataColumn(label: Text('P4')),
                    DataColumn(label: Text('Nota 1')),
                    DataColumn(label: Text('Nota 2')),
                    DataColumn(label: Text('Final')),
                  ],
                  rows: List<DataRow>.generate(
                    historicalEntries.length,
                    (index) {
                      final entry = historicalEntries[index];
                      return DataRow(
                        cells: [
                          DataCell(Text('${entry['P1']}')),
                          DataCell(Text('${entry['P2']}')),
                          DataCell(Text('${entry['P3']}')),
                          DataCell(Text('${entry['P4']}')),
                          DataCell(Text('${entry['Nota1']}')),
                          DataCell(Text('${entry['Nota2']}')),
                          DataCell(Text('${entry['NotaFinal']}')),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: historicalEntries.length,
            //     itemBuilder: (context, index) {
            //       final entry = historicalEntries[index];
            //       return Card(
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Historial ${index+1}'),

            //               // Row(
            //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               //   children: [
            //               //     Text("P1: ${entry['P1']}"),
            //               //     Text("P2: ${entry['P2']}"),
            //               //     Text("P3: ${entry['P3']}"),
            //               //     Text("P4: ${entry['P4']}"),
            //               //   ]
            //               // ),
            //               // Row(
            //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               //   children: [
            //               //     Text("Promedio: ${entry['promedio']}"),
            //               //     Text("N1: ${entry['Nota1']}"),
            //               //     Text("N2: ${entry['Nota2']}"),
            //               //   ]
            //               // ),
            //               Text("N Final: ${entry['NotaFinal']}")
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
