import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/profile_cards/presentation/providers/profile_cards_provider.dart';
import 'package:market_check/features/profile_cards/presentation/widgets/favorite_products/favorite_product_item.dart';
import 'package:provider/provider.dart';

class FavoriteProductsScreenBody extends StatelessWidget {
  final ProfileCardsProvider profileCardsProvider;

  const FavoriteProductsScreenBody(
      {super.key, required this.profileCardsProvider});

  @override
  Widget build(BuildContext context) {
    return context.watch<ProfileCardsProvider>().favoriteProducts.isEmpty
        ? const Center(
            child: NotFoundPlaceHolder(
                text: 'Aun no tienes productos\nfavoritos...'),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.015,
                vertical: ScreenSize.absoluteHeight * 0.015),
            itemCount: profileCardsProvider.favoriteProducts.length,
            itemBuilder: (context, index) => FavoriteProductItem(
              purchase: profileCardsProvider.favoriteProducts[index],
            ),
          );
  }
}
