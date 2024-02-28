import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class ShoppingListListile extends StatelessWidget {
  final ShoppingListModel shoppingListsModel;
  const ShoppingListListile({
    super.key,
    required this.shoppingListsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            shoppingListsModel.nameList,
            style: const TextStyle(fontSize: 18),
          ),
          leading: const Icon(
            Icons.bookmark_added_outlined,
            size: 25,
            color: AppColors.appSecondary,
          ),
          trailing: IconButton(
            onPressed: () {
              context.read<ShoppingListsProvider>().deleteList();
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              size: 25,
              color: AppColors.appPrimary,
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1)
      ],
    );
  }
}
