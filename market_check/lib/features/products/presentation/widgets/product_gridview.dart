import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/presentation/widgets/product_listile.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> productsList;
  const ProductsGridView({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: ScreenSize.width * 0.9,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5 / 3,
          ),
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            final products = productsList[index];
            return ProductsListTile(productModel: products);
          },
        ),
      ),
    );
  }
}