import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/presentation/widgets/product_list_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> productsList;
  const ProductsGridView({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          childAspectRatio: 5 / 3,
        ),
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return ProductsListItem(productModel: productsList[index]);
        },
      ),
    );
  }
}
