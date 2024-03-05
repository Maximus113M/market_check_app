import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
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
      surfaceTintColor: AppColors.white,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Nueva Lista',
                  style: FontStyles.heading11(AppColors.text),
                ),
                Image.asset(
                  AppAssets.listIcon,
                  height: ScreenSize.absoluteHeight * 0.05,
                )
              ],
            ),
            TextFormField(
              onChanged: (value) {
                listName = value;
              },
            ),
            SizedBox(height: ScreenSize.absoluteHeight * 0.03),
            CustomButton(
              text: 'Crear lista',
              textStyle: FontStyles.bodyBold0(AppColors.appPrimary),
              color: AppColors.appPrimary,
              bgColor: AppColors.appSecondary,
              action: () {
                context
                    .read<ShoppingListsProvider>()
                    .createShoppingList(context, listName);
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
