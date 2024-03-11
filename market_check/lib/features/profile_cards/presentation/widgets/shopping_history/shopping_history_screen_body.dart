import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/profile_cards/presentation/widgets/shopping_history/shopping_history_item.dart';
import 'package:market_check/features/profile_cards/presentation/providers/profile_cards_provider.dart';

import 'package:provider/provider.dart';

class ShoppingHistoryScreenBody extends StatelessWidget {
  final ProfileCardsProvider profileCardsProvider;

  const ShoppingHistoryScreenBody(
      {super.key, required this.profileCardsProvider});

  @override
  Widget build(BuildContext context) {
    return profileCardsProvider.purchases.isEmpty
        ? const Center(
            child: NotFoundPlaceHolder(text: 'No se encontraron\ncompras...'),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.05,
                vertical: ScreenSize.absoluteHeight * 0.02),
            itemCount: profileCardsProvider.purchases.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                profileCardsProvider.getPurchaseProducts(
                    context, profileCardsProvider.purchases[index]);
              },
              child: ShoppingHistoryItem(
                  purchase: profileCardsProvider.purchases[index],
                  stores: context.watch<StoresProvider>().storeList),
            ),
          );
  }
}
