import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PacienteForm(),
    );
  }
}

class PacienteForm extends StatefulWidget {
  const PacienteForm({super.key});

  @override
  State<PacienteForm> createState() => _PacienteFormState();
}

class _PacienteFormState extends State<PacienteForm> {
  // Controladores para leer lo que escribe el usuario
  final TextEditingController sodioController = TextEditingController();
  final TextEditingController bunController = TextEditingController();
  final TextEditingController glucosaController = TextEditingController();

  String resultado = ""; // Aquí mostraremos los datos ingresados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Dogtor App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Osmolaridad Sérica",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de texto para Sodio
            TextField(
              controller: sodioController,
              decoration: const InputDecoration(
                labelText: "Sodio (mEq/L)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Campo de texto para bun
            TextField(
              controller: bunController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "BUN (o Urea/6)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            
            // Campo de texto para glucosa
            TextField(
              controller: glucosaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Glucosa (mg/dl)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Botón para guardar
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double sodio = double.tryParse(sodioController.text) ?? 0;
                  double bun = double.tryParse(bunController.text) ?? 0;
                  double glucosa = double.tryParse(glucosaController.text) ?? 0;

                  resultado =
                      "Osmolaridad Sérica: ${((sodio*2)+(bun/2.8)+(glucosa/18)).toStringAsFixed(1)}mEq/L";
                });
              },
              child: const Text("Calcular"),
            ),

            const SizedBox(height: 20),

            // Mostrar resultados
            Text(
              resultado,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}