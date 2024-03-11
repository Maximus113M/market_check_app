import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  static const String name = 'products-categories';
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        isCartVisible: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
        title: Text(
          context.read<CategoriesProvider>().currentCategorie!.name,
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
      ),
      body: ProductsScreen(
        productsList:
            context.watch<ProductsProvider>().filteredProductsList,
      ),
    );
  }
}
