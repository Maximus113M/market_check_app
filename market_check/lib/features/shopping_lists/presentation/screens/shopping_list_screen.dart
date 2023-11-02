import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  static const String name = "shopping-list-screen";
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listas de Compras"),
        ),
        body: Container(
          child: const Text("LISTAS"),
        ));
  }
}
