import 'package:flutter/material.dart';

class ShoppingHistoryScreen extends StatelessWidget {
  static const String name = "history-screen";
  const ShoppingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historial de Compra")),
      body: const Center(
          child: Text("PURCHASED", style: TextStyle(fontSize: 40))),
    );
  }
}
