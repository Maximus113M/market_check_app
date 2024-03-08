import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_history/presentation/widgets/shopping_history_item.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';

import 'package:provider/provider.dart';

class ShoppingHistoryScreenBody extends StatelessWidget {
  final ShoppingHistoryProvider shoppingHistoryProvider;

  const ShoppingHistoryScreenBody(
      {super.key, required this.shoppingHistoryProvider});

  @override
  Widget build(BuildContext context) {
    return shoppingHistoryProvider.purchases.isEmpty
        ? const Center(
            child: NotFoundPlaceHolder(text: 'No se encontraron\ncompras...'),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.05,
                vertical: ScreenSize.absoluteHeight * 0.02),
            itemCount: shoppingHistoryProvider.purchases.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                shoppingHistoryProvider.getPurchaseProducts(
                    context, shoppingHistoryProvider.purchases[index]);
              },
              child: ShoppingHistoryItem(
                  purchase: shoppingHistoryProvider.purchases[index],
                  stores: context.watch<StoresProvider>().storeList),
            ),
          );
  }
}
