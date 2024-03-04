import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class NewListDialog extends StatelessWidget {
  const NewListDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String listName = '';
    return AlertDialog(
      title: Text(
        'Nueva Lista',
        style: FontStyles.bodyBold0(AppColors.appSecondary),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            onChange: (value) {
              listName = value;
            },
            hint: 'Nombre de la lista',
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'Crear lista',
            action: () {
              final String listname = listName;
              context
                  .read<ShoppingListsProvider>()
                  .createShoppingList(context, listname);
              context.pop();
            },
            horizontalMargin: 0,
          ),
        ],
      ),
    );
  }
}
