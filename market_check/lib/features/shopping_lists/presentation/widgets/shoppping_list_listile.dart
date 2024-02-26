import 'package:flutter/material.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';

class ShoppingListListile extends StatelessWidget {
  final ShoppingListsModel shoppingListsModel;
  const ShoppingListListile({
    super.key,
    required this.shoppingListsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(shoppingListsModel.nameList),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        ),
        const Divider(height: 1, thickness: 1)
      ],
    );
  }
}
