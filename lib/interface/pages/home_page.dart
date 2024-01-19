import 'package:calcular_notas/interface/pages/calculate_notes_page.dart';
import 'package:calcular_notas/interface/pages/history_calculate_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalculateScreen(),
                ),
              ),
              child: Text('Calcula Notas'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistoryCalculateScreen(),
                ),
              ),
              child: Text('Calcula Notas con historial'),
            ),
          ],
        ),
      ),
    );
  }
}
