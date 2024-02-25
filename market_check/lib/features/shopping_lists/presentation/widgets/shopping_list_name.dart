import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/shoppping_list_listile.dart';

class ShoppingListName extends StatelessWidget {
  final List<ShoppingListsModel> shoppingList;
  const ShoppingListName({
    super.key,
    required this.shoppingList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (context, index) {
          final list = shoppingList[index];
          return GestureDetector(
            onTap: () {},
            child: ShoppingListListile(shoppingListsModel: list),
          );
        },
      ),
    );
  }
}