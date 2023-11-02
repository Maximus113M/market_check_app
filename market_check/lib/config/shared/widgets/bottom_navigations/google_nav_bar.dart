import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBar extends StatelessWidget {
  const GoogleNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
        backgroundColor: Colors.white,
        tabMargin: const EdgeInsets.fromLTRB(0, 5, 0, 7),
        hoverColor: const Color.fromARGB(255, 200, 200, 200),
        haptic: true, // haptic feedback
        tabBorderRadius: 16, // ++
        tabBorder: Border.all(width: 0.3, color: Colors.grey.shade500),
        tabShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 223, 223, 223).withOpacity(0.4),
              blurRadius: 8)
        ],
        duration: const Duration(milliseconds: 300),
        gap: 7,
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.black, //Colors.white, //Colors.blue.shade700,
        iconSize: 25,
        tabBackgroundColor: Colors.blue
            .shade50, //const Color.fromARGB(255, 207, 207, 207).withOpacity(0.5), // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.storefront,
            text: 'Tiendas',
          ),
          GButton(
            icon: Icons.qr_code,
            text: 'Escanear',
          ),
          GButton(
            icon: Icons.list_outlined,
            text: 'Listas',
          ),
          GButton(
            icon: Icons.person,
            text: 'Cuenta',
          )
        ]);
  }
}
