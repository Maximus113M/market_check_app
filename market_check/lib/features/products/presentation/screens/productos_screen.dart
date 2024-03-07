import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/loadings/loadings.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/products/presentation/widgets/product_list_item.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/search_product_offer.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const String name = 'products-view';
  final List<ProductModel> productsList;

  const ProductsScreen({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SearchProducts(),
          context.watch<ProductsProvider>().isLoading
              ? Loadings.lottieLoading()
              : Expanded(
                  child: SizedBox(
                    width: ScreenSize.width * 0.9,
                    child: productsList.isEmpty
                        ? const NotFoundPlaceHolder(
                            text: 'No se encontraron\nproductos...',
                            bottomSpacing: 0.2,
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 3,
                            ),
                            itemCount: productsList.length,
                            itemBuilder: (context, index) {
                              return ProductsListItem(
                                productModel: productsList[index],
                              );
                            },
                          ),
                  ),
                ),
        ],
      ),
    );
  }
}
