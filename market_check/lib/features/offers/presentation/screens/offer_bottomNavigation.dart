import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'inicio',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Tiendas'),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.list),
                  label: 'Listas'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Mi cuenta'),
            ]),
      ),
    );
  }
}
