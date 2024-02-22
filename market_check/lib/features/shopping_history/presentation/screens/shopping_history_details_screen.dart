import 'package:flutter/material.dart';

import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';
import 'package:market_check/features/shopping_history/presentation/widgets/shopping_history_modal_details.dart';

import 'package:provider/provider.dart';

class ShoppingHistoryDetailsScreen extends StatelessWidget {
  static const String name = "history-details-screen";
  const ShoppingHistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ShoppingHistoryModalDetails(
          currentPurchase:
              context.watch<ShoppingHistoryProvider>().currentPurchase!,
          stores: context.watch<StoresProvider>().storeList,
        ),
      ),
    );
  }
}
