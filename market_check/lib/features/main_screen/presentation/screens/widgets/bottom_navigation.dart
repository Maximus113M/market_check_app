import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_badge_icon.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/pending_purchases/presentation/providers/pending_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';

import 'package:provider/provider.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin:
          EdgeInsets.symmetric(horizontal: ScreenSize.absoluteHeight * 0.022)
              .copyWith(bottom: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 25,
          offset: const Offset(8, 20),
        ),
      ]),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.appPrimary,
          selectedItemColor: AppColors.appSecondary,
          unselectedItemColor: Colors.white,
          currentIndex: context.watch<MainProvider>().currentIndex,
          onTap: (index) {
            context.read<MainProvider>().setCurrentIndex(index);
            switch (index) {
              case 0:
                context.read<StoresProvider>().loadStores(context);
                break;
              case 1:
                context.read<ShoppingListsProvider>().getShoppingLists(context);
                break;
              case 2:
                context
                    .read<PendingPurchaseProvider>()
                    .getOpenPurchase(context);

                break;
              default:
            }
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Tiendas',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Listas',
            ),
            BottomNavigationBarItem(
              icon: CustomBadge(
                  icon: Icons.shopping_bag,
                  iconSize: 25,
                  counter: AuthService.user!.isPurchaseOpen ? 1 : 0),
              label: 'Compras',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mi cuenta',
            ),
          ]),
    );
  }
}
