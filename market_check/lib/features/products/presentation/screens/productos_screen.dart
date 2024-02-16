import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/offers/presentation/widgets/search_product_offer.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const String name = 'products-view';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          const SearchProducts(),
          ProductsListView(
            productsList:
                context.watch<ProductsProvider>().filteredProductsList),

        ] 
      ),
    );
  }
}

class ProductsListView extends StatelessWidget {
  final List<ProductModel> productsList;
  const ProductsListView({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final products = productsList[index];
          return ProductsListTile(productModel: products);
        },
      ),
    );
  }
}

class ProductsListTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductsListTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productModel.name),
      subtitle: Text('${productModel.originalPrice}'),
      leading: const Icon(Icons.star_rounded),
    );
  }
}
