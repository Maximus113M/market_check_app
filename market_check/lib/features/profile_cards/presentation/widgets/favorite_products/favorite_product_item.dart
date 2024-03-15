import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/profile_cards/data/models/favorite_product_model.dart';

class FavoriteProductItem extends StatelessWidget {
  final FavoriteProductModel purchase;

  const FavoriteProductItem({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.absoluteHeight * 0.01,
          horizontal: ScreenSize.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.disabled,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.width * 0.04),
        ),
        boxShadow: AppShadows.profileShadow,
        color: AppColors.white.withOpacity(0.95),
      ),
      child: Row(
        children: [
          Icon(
            Icons.loyalty,
            color: AppColors.appPrimary,
            size: ScreenSize.absoluteHeight * 0.05,
          ),
          SizedBox(
            width: ScreenSize.width * 0.32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                    purchase.storeName,
                    maxLines: 2,
                    style: FontStyles.bodyBold1(AppColors.appSecondary),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  purchase.productName,
                  style: FontStyles.body4(AppColors.text),
                  maxLines: 2,
                ),
                Text(
                  'Total: ${purchase.total}',
                  style: FontStyles.body4(AppColors.text),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
