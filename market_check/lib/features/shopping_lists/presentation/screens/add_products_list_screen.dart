import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/shopping_lists/data/models/shopping_lists_model.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';

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
          style: FontStyles.subtitle0(AppColors.white),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
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
              height: ScreenSize.absoluteHeight * 0.6,
              child: ShoppingListProductsListview(
                shoppingListsProvider: context.read(),
                productList:
                    context.watch<ShoppingListsProvider>().currentShoppingList!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingListProductsListview extends StatelessWidget {
  final ShoppingListsProvider shoppingListsProvider;
  final ShoppingListModel productList;

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
