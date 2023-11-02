import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  static const String name = 'shopping-cart';
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 30),
            onPressed: () {},
          ),
          const SizedBox(width: 10)
        ],
        title: const Text("Carrito"),
      ),
    );
  }
}
