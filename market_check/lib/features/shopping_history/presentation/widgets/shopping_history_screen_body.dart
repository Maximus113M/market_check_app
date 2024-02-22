import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';

class ShoppingHistoryScreenBody extends StatelessWidget {
  final ShoppingHistoryProvider shoppingHistoryProvider;

  const ShoppingHistoryScreenBody(
      {super.key, required this.shoppingHistoryProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingHistoryProvider.purchases.length,
      itemBuilder: (context, index) => Text(
        '${shoppingHistoryProvider.purchases[index].date}',
      ),
    );
  }
}
