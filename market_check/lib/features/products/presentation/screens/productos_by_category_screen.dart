import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/offers/presentation/widgets/search_product_offer.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/screens.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  static const String name = 'products-categories';
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leading: IconButton(
          onPressed: ()=>context.pushReplacement('/offers-m'), 
          icon: const Icon(Icons.arrow_back,
          color: AppColors.appSecondary,))
      ),
      body: Column(children: [
        Expanded(
          child: ProductsScreen(
              productsList:
                  context.watch<ProductsProvider>().filteredProductsList),
        ),
      ]),
    );
  }
}

