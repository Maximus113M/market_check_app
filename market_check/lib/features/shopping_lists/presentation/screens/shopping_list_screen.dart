import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';

class ShoppingListScreen extends StatelessWidget {
  static const String name = "shopping-list-screen";
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        body: Container(
          child: const Text("LISTAS"),
        ));
  }
}
