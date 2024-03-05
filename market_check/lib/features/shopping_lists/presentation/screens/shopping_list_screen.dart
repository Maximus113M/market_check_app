import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/widgets/shopping_list_name.dart';

import 'package:provider/provider.dart';

class ShoppingListScreen extends StatelessWidget {
  static const String name = "shopping-list-screen";
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SingleChildScrollView(
        child: context.watch<ShoppingListsProvider>().shoppingLists.isEmpty
            ? Center(
                heightFactor: 1.8,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Images/lista.png',
                      width: ScreenSize.width * 0.4,
                    ),
                    const Text(
                      "No tienes listas guardadas",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.absoluteHeight * 0.03,
                        vertical: ScreenSize.width * 0.03,
                      ),
                      child: const Text(
                        '¡Organiza tus compras de forma rápida y sencilla! Crea tu lista de productos aquí y mantén un control eficaz de tus compras.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<ShoppingListsProvider>()
                            .showCreateListDialog(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.appPrimary,
                      ),
                      label: const Text(
                        'Crea tu lista',
                        style: TextStyle(color: AppColors.appPrimary),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenSize.absoluteHeight * 0.01),
                    child: Text(
                      'Mis listas',
                      style: FontStyles.heading11(AppColors.appSecondary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenSize.absoluteHeight * 0.01,
                      horizontal: ScreenSize.width * 0.04,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<ShoppingListsProvider>()
                            .showCreateListDialog(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            color: AppColors.appSecondary,
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.025,
                          ),
                          Text(
                            ' Crear nueva lista',
                            style: FontStyles.body0(AppColors.text),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: ScreenSize.absoluteHeight * 0.68,
                    child: ShoppingListName(
                      shoppingList:
                          context.watch<ShoppingListsProvider>().shoppingLists,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
