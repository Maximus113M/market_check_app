import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/products/data/models/product_model.dart';


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
      child: ListTile(
        title: Text(
          productModel.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('\$ ${productModel.originalPrice}'),
        leading: const Icon(
          Icons.loyalty,
          size: 30,
          color: AppColors.appPrimary,
        ),
      ),
    );
  }
}
