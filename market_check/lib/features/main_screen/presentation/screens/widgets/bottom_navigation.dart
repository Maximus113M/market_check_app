import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:provider/provider.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 25,
          offset: const Offset(8, 20),
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.appPrimary,
            selectedItemColor: AppColors.appSecondary,
            unselectedItemColor: Colors.white,
            currentIndex: context.watch<MainProvider>().currentIndex,
            onTap: (index) {
              context.read<MainProvider>().setCurrentIndex(index);
              /*switch (index) {
                case 0:
                 context.push('/stores-m');
                  break;
                case 1:
                 context.push('/offers-m');
                  break;
                case 2:
                 context.push('/lists');
                break;
                case 3:
                context.push('/profile');
                break;
              }*/
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'inicio',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store), label: 'Tiendas'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listas'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Mi cuenta'),
            ]),
      ),
    );
  }
}