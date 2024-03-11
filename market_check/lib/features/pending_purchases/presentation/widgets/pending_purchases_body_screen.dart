import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/pending_purchases/presentation/widgets/pending_purchases_card.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';
import 'package:market_check/features/pending_purchases/presentation/providers/pending_provider.dart';

import 'package:provider/provider.dart';

class PendingPurchasesBodyScreen extends StatelessWidget {
  final PendingPurchaseProvider pendingPurchaseProvider;
  const PendingPurchasesBodyScreen(
      {super.key, required this.pendingPurchaseProvider});

  @override
  Widget build(BuildContext context) {
    return pendingPurchaseProvider.openPurchase != null
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: ScreenSize.absoluteHeight * 0.02,
                ),
                if (pendingPurchaseProvider.openPurchase != null)
                  PendingPurchasesCard(
                    products: context
                        .watch<ShoppingHistoryProvider>()
                        .registeredPurchaseItems,
                    purchase: pendingPurchaseProvider.openPurchase!,
                    store: context.watch<StoresProvider>().storeList.firstWhere(
                          (store) =>
                              store.id ==
                              pendingPurchaseProvider
                                  .openPurchase!.establecimientoId,
                        ),
                  ),
              ],
            ),
          )
        : const Center(
            heightFactor: 3,
            child: NotFoundPlaceHolder(
              text: 'No tienes compras\npendientes...',
              bottomSpacing: 0,
            ),
          );
  }
}
