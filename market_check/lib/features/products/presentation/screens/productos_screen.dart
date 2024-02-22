import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/offers/presentation/widgets/search_product_offer.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/products/presentation/widgets/product_gridview.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const String name = 'products-view';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leading: IconButton(
          onPressed: () {
            context.push('/offers-m');
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.appSecondary),
        ),
      ),
      body: Column(children: [
        const SearchProducts(),
        ProductsGridView(
            productsList:
                context.watch<ProductsProvider>().filteredProductsList),
      ]),
    );
  }
}



