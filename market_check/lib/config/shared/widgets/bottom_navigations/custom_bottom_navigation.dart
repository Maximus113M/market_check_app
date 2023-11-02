import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
            activeIcon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'Tiendas',
            activeIcon: Icon(Icons.storefront_sharp)),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_list_outlined),
            label: 'Listas',
            activeIcon: Icon(Icons.view_list_outlined)),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            activeIcon: Icon(Icons.person))
      ],
    );
  }
}
