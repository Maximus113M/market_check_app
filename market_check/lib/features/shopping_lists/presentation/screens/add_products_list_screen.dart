import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/shopping_list_products_listview.dart';

import 'package:provider/provider.dart';

class AddProductsListScreen extends StatelessWidget {
  static const name = 'addProducts-lists';
  final ShoppingListsProvider shoppingListsProvider;

  const AddProductsListScreen({super.key, required this.shoppingListsProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        isCartVisible: false,
        title: Text(
          shoppingListsProvider.currentShoppingList!.nameList,
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.absoluteHeight * 0.03,
                      horizontal: ScreenSize.width * 0.05)
                  .copyWith(
                bottom: ScreenSize.absoluteHeight * 0.01,
              ),
              child: CustomTextFormField(
                onChange: (value) {
                  shoppingListsProvider.productNameController.text = value;
                },
                textController:
                    context.read<ShoppingListsProvider>().productNameController,
                hint: 'Ingresa el nombre del producto',
                suffixIcon: IconButton(
                  onPressed: () {
                    shoppingListsProvider.addProductsToList();
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 25,
                    color: AppColors.text,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.absoluteHeight * 0.68,
              child: ShoppingListProductsListview(
                shoppingListsProvider: context.read(),
                productList:
                    context.watch<ShoppingListsProvider>().currentShoppingList!,
              ),
            ),
            Divider(
              indent: ScreenSize.width * 0.05,
              endIndent: ScreenSize.width * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenSize.width * 0.08),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Total: ${context.watch<ShoppingListsProvider>().currentShoppingList!.products.length}',
                  style: FontStyles.bodyBold0(AppColors.text),
                ),
              ),
            ),
            SizedBox(height: ScreenSize.absoluteHeight * 0.015),
            CustomButton(
              radius: 0.06,
              text: 'GUARDAR CAMBIOS',
              color: AppColors.appPrimary,
              action: () {
                shoppingListsProvider.updateShoppingList(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
