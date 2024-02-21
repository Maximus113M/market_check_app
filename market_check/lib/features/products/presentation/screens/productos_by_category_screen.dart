import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/offers/presentation/widgets/search_product_offer.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  static const String name = 'products-categories';
  const ProductsByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(children: [
        const SearchProducts(),
        ProductsGridView(
            productsList:
                context.watch<ProductsProvider>().filteredProductsList),
      ]),
    );
  }
}

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

class ProductsListTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductsListTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appGray),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        
        
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.02, horizontal: ScreenSize.width * 0.02),
        child: ListTile(
          title: Text(productModel.name, style: const TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('\$ ${productModel.originalPrice}'),
          leading: const Icon(
            Icons.loyalty,
            size: 40,
            color: AppColors.appPrimary,
          ),
        ),
      ),
    );
  }
}
