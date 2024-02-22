import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';
import 'package:market_check/features/shopping_history/presentation/widgets/shopping_history_screen_body.dart';
import 'package:provider/provider.dart';

class ShoppingHistoryScreen extends StatelessWidget {
  static const String name = "history-screen";

  const ShoppingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historial de Compra")),
      body: ShoppingHistoryScreenBody(
        shoppingHistoryProvider: Provider.of<ShoppingHistoryProvider>(context),
      ),
    );
  }
}
