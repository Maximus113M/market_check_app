import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/shopping_list_name.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/show_modal_bottom.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CreateShoppingListScreen extends StatelessWidget {
  static const name = 'create-lists';
  const CreateShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appSecondary,
            ),
          ),
          title: Text(
            'Mis listas',
            style: FontStyles.subtitle0(AppColors.appSecondary),
          ),
          isCartVisible: false),
      body: Column(
        children: [
          ShoppingListName(
            shoppingList: context.watch<ShoppingListsProvider>().shoppingList,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appPrimary,
        onPressed: () {},
        child: const ShowModalBottomSheet(),
      ),
    );
  }
}
