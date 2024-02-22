import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_history/presentation/widgets/shopping_history_item.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';
import 'package:market_check/features/shopping_history/presentation/screens/shopping_history_details_screen.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ShoppingHistoryScreenBody extends StatelessWidget {
  final ShoppingHistoryProvider shoppingHistoryProvider;

  const ShoppingHistoryScreenBody(
      {super.key, required this.shoppingHistoryProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width * 0.05,
          vertical: ScreenSize.absoluteHeight * 0.02),
      itemCount: shoppingHistoryProvider.purchases.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          shoppingHistoryProvider.currentPurchase =
              shoppingHistoryProvider.purchases[index];
          shoppingHistoryProvider.showShoppingHistoryModal(context);
        },
        child: ShoppingHistoryItem(
            purchase: shoppingHistoryProvider.purchases[index],
            stores: context.watch<StoresProvider>().storeList),
      ),
    );
  }
}
