import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/menus/menu_categories.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class PendingPurchasesScreen extends StatelessWidget {
  static const String name = "store-items-screen";
  const PendingPurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const _StoreItemsView(),
      backgroundColor: Colors.transparent,
    );
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
