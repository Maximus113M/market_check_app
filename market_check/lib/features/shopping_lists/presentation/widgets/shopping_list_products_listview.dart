import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';
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
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.01),
      itemCount: productList.products.length,
      itemBuilder: (context, index) => Container(
        /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.disabled)),*/
        width: double.infinity,
        height: ScreenSize.absoluteHeight * 0.05,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.01,
            ),
            child: Text(productList.products[index].itemName),
          ),
          value: productList.products[index].isSelected,
          onChanged: (value) {
            shoppingListsProvider.selectdCheckBox(index);
          },
          checkboxShape: const CircleBorder(),
        ),
      ),
    );
  }
}
