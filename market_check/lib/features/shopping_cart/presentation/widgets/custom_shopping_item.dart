import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/add_remove_button.dart';
import 'package:market_check/features/shopping_cart/domain/entities/shopping_item_entity.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';

import 'package:provider/provider.dart';

class CustomShoppingItem extends StatelessWidget {
  final ShoppingItemEntity item;
  final int index;

  const CustomShoppingItem(
      {super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return Container(
      height: ScreenSize.height(context) * 0.15,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightText.withOpacity(0.025)),
      child: Stack(
        children: [
          Positioned(
            top: ScreenSize.height(context) * 0.055,
            right: 2,
            child: AddRemoveButton(
              count: shoppingCartProvider.shoppingList[index].quanty,
              addAction: () => shoppingCartProvider.incrementItemQuanty(index),
              removeAction: () =>
                  shoppingCartProvider.decrementItemQuanty(index),
            ),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  height: ScreenSize.height(context) * 0.125,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                    width: 140,
                    child: Text(
                      item.name,
                      maxLines: 2,
                      style: FontStyles.bodyBold2(
                        context,
                        AppColors.text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: ScreenSize.height(context) * 0.12,
            bottom: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '\$${item.totalPrice}',
                style: FontStyles.bodyBold1(context, AppColors.lightText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
