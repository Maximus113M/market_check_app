import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/add_remove_button.dart';
import 'package:market_check/features/shopping/data/models/shopping_cart_item_model.dart';
import 'package:market_check/features/shopping/presentation/providers/shopping_provider.dart';

class CustomShoppingItem extends StatelessWidget {
  final ShoppingCartItemModel item;
  final ShoppingProvider shoppingCartProvider;
  final int index;

  const CustomShoppingItem(
      {super.key,
      required this.index,
      required this.item,
      required this.shoppingCartProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: ScreenSize.absoluteHeight * 0.1),
      padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.03,
              vertical: ScreenSize.absoluteHeight * 0.01)
          .copyWith(right: ScreenSize.width * 0.02),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightText.withOpacity(0.04),
      ),
      child: Row(
        children: [
          Icon(
            Icons.loyalty,
            size: ScreenSize.height * 0.058,
            color: AppColors.appSecondary,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: ScreenSize.absoluteHeight * 0.08,
                    maxWidth: ScreenSize.width * 0.37,
                    minWidth: ScreenSize.width * 0.37,
                  ),
                  child: Text(
                    item.product.name,
                    maxLines: 2,
                    style: FontStyles.bodyBold3(
                      AppColors.text,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${item.product.description}',
                  style: FontStyles.bodyBold4(AppColors.lightText),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    '\$${item.totalPrice}',
                    style: FontStyles.bodyBold2(AppColors.text),
                  ),
                ),
              ],
            ),
          ),
          AddRemoveButton(
            count: item.quanty,
            addAction: () => shoppingCartProvider.incrementItemQuanty(index),
            removeAction: () => shoppingCartProvider.decrementItemQuanty(index),
          ),
        ],
      ),
    );
  }
}
