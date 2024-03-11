import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

import 'package:animate_do/animate_do.dart';

class ProductsListItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductsListItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.005),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.appGray),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5).copyWith(left: 6),
              child: Icon(
                Icons.loyalty,
                size: ScreenSize.absoluteHeight * 0.04,
                color: AppColors.appPrimary,
              ),
            ),
            Tooltip(
              message: productModel.name.length > 32 ? productModel.name : '',
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.1),
              textAlign: TextAlign.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: ScreenSize.absoluteHeight * 0.048,
                        maxWidth: ScreenSize.height * 0.15),
                    child: Text(
                      productModel.name,
                      style: FontStyles.bodyBold3(AppColors.text),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text('\$ ${productModel.originalPrice}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
