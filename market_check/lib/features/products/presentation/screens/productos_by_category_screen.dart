import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';

import 'package:provider/provider.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  static const String name = 'products-categories';
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Column(children: [
        Expanded(
          child: ProductsScreen(
            productsList:
                context.watch<ProductsProvider>().filteredProductsList,
          ),
        ),
      ]),
    );
  }
}
