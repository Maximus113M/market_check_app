import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/profile_cards/presentation/widgets/favorite_products/favorite_products_screen_body.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class FavoriteProductsScreen extends StatelessWidget {
  static const String name = '/favorite-products';
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
        title: Text(
          'Productos Favoritos',
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
        isCartVisible: false,
      ),
      body: FavoriteProductsScreenBody(
        profileCardsProvider: context.read(),
      ),
    );
  }
}
