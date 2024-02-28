import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/pending_purchases/presentation/providers/pending_provider.dart';
import 'package:market_check/features/shopping_history/presentation/providers/shopping_history_porvider.dart';
import 'package:provider/provider.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final mainProvider = Provider.of<MainProvider>(context);
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
            if(index==2){
              context.read<PendingPurchaseProvider>().getOpenPurchase(context);
             // context.read<ShoppingHistoryProvider>().getOpenPurchase(context);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Tiendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Listas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Compras',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mi cuenta',
            ),
          ]),
    );
  }
}
