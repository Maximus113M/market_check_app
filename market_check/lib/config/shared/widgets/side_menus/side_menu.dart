import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/menus/side_menu_items.dart';

class SideMenu extends StatefulWidget {
  //Argumento solicitado para establecer la ruta de vuelta por defecto - DESACTIVADO by now
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appSideMenuItems[value];
          context.push(menuItem.link);
          //widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          //verifica el espacio superior por defecto del dispositivo
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: const Text("Menu", style: TextStyle(fontSize: 20)),
          ),
          ...appSideMenuItems.sublist(0, 4).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          //Division
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
            child: Divider(),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Text("Perfil", style: TextStyle(fontSize: 17))),
          ...appSideMenuItems.sublist(4).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}
