import 'package:flutter/material.dart';

//import 'package:market_check/config/shared/widgets/side_menus/side_menu.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(children: [
          //SideMenu(scaffoldKey: ),
          Text(title, style: textStyles.titleLarge),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ]),
      ),
    ));
  }
}
