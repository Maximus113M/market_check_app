import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/shopping_list_name.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/show_modal_bottom.dart';
import 'package:provider/provider.dart';

class CreateShoppingListScreen extends StatelessWidget {
  static const name = 'create-lists';
  const CreateShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenSize.absoluteHeight * 0.02),
            child: const Text(
              'Mis Listas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ShoppingListName(
            shoppingList: context.watch<ShoppingListsProvider>().shoppingList,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const ShowModalBottomSheet(),
      ),
    );
  }
}
