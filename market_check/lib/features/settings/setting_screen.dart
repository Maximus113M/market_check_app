import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = "settings-screen";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configuracion")),
      body:
          const Center(child: Text("SETTINGS", style: TextStyle(fontSize: 40))),
    );
  }
}
