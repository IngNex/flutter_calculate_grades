import 'package:calcular_notas/interface/pages/calculate_notes_page.dart';
import 'package:calcular_notas/interface/pages/history_calculate_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showText = true;

  @override
  void initState() {
    super.initState();
    // Mostrar el texto por 1 minuto y luego ocultarlo
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showText = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Calcular Notas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CalculateScreen(),
                  ),
                ),
                child: const Text('Calcula Notas'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HistoryCalculateScreen(),
                  ),
                ),
                child: const Text('Calcula Notas con historial'),
              ),
              const SizedBox(height: 50),
              showText
                  ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hola Bienvenida ',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '❤️¡Te amo mi amorcito! ❤️',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '❤️ mi kathita ❤️',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
