import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/menus/menu_categories.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class PendingPurchasesScreen extends StatelessWidget {
  static const String name = "store-items-screen";
  const PendingPurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: AppColors.gradientColors)),
        child: Scaffold(
          appBar: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(18))),
              title: const Text("Categorias"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart))
              ]),
          body: const _StoreItemsView(),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: const GoogleNavBar(),
        ));
  }
}

class _StoreItemsView extends StatelessWidget {
  const _StoreItemsView();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * 0.85,
      width: ScreenSize.width,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      margin: EdgeInsets.fromLTRB(
          ScreenSize.width * 0.025, 13, ScreenSize.width * 0.025, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: ListView.builder(
        itemCount: appSubmenuCategories.length,
        itemBuilder: (context, index) {
          final categories = appSubmenuCategories[index];
          return ListTile(
            leading:
                Image.asset(categories.poster, width: 100, fit: BoxFit.cover),
            title: Text(categories.title),
            subtitle: Text(categories.subtitle ?? ''),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          );
        },
      ),
    );
  }
}
