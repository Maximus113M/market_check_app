import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';

class ShoppingListProductsListview extends StatelessWidget {
  final ShoppingListsProvider shoppingListsProvider;
  final ShoppingListsModel productList;

  const ShoppingListProductsListview({
    super.key,
    required this.shoppingListsProvider,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.01)
          .copyWith(bottom: ScreenSize.absoluteHeight * 0.01),
      itemCount: productList.products.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.04)
            .copyWith(bottom: ScreenSize.absoluteHeight * 0.008),
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: ScreenSize.absoluteHeight * 0.05,
          maxHeight: ScreenSize.absoluteHeight * 0.2,
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: AppColors.appSecondary,
              value: productList.products[index].isSelected,
              onChanged: (value) => shoppingListsProvider.selectCheckBox(index),
            ),
            SizedBox(
              width: ScreenSize.width * 0.66,
              child: Text(
                productList.products[index].itemName,
                style: FontStyles.body1(AppColors.text),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {
                shoppingListsProvider.removeListItem(index);
              },
              icon: Icon(
                Icons.cancel,
                color: AppColors.errorText.withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
