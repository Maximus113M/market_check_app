import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedBottomNavigation extends StatelessWidget {
  const CurvedBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    ///final colors = Theme.of(context).colorScheme;
    return CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.blue.shade700,
        buttonBackgroundColor: Colors.grey.shade100,
        height: 48,
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.storefront_outlined),
          Icon(Icons.view_list_outlined),
          Icon(Icons.person),
        ]);
  }
}    
    
    
    /*BottomNavigationBar(
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
}*/
