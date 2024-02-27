import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class AddProductsListScreen extends StatelessWidget {
  static const name = 'addProducts-lists';
  //final List<ShoppingListsModel> listProduct;
  const AddProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String productName = '';
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenSize.absoluteHeight * 0.05,
                horizontal: ScreenSize.width * 0.03),
            child: CustomTextFormField(
              onChange: (value) {
                productName = value;
              },
              textController:
                  context.read<ShoppingListsProvider>().customTextForm,
              hint: 'Ingresa el nombre del producto',
              suffixIcon: IconButton(
                onPressed: () {
                  Provider.of<ShoppingListsProvider>(context, listen: false)
                      .addProductsToList(productName);
                  Provider.of<ShoppingListsProvider>(context, listen: false)
                      .clearCustomTextform();
                },
                icon: const Icon(
                  Icons.send,
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<ShoppingListsProvider>(
              builder: (context, provider, child) {
                return ShoppingListProductsListview(
                    shoppingListsProvider: provider);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingListProductsListview extends StatelessWidget {
  final ShoppingListsProvider shoppingListsProvider;
  const ShoppingListProductsListview({
    super.key,
    required this.shoppingListsProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: shoppingListsProvider.shoppingList.length,
          itemBuilder: (context, index) {
            final List<String> productList =
                shoppingListsProvider.shoppingList[index].products;
            List<Widget> listTiles = [];
            productList.forEach(
              (productName) {
                listTiles.add(
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: double.infinity,
                      height: ScreenSize.absoluteHeight * 0.05,
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.width * 0.03,
                              vertical: ScreenSize.absoluteHeight * 0.001),
                          child: Text(productName),
                        ),
                        value: context.watch<ShoppingListsProvider>().checkBox,
                        onChanged: (value) {
                          context.read<ShoppingListsProvider>().selectdCheckBox(value!);
                        },
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                );
              },
            );
            return Column(
              children: listTiles,
            );
          },
        ),
      ),
    );
  }
}
