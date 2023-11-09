import 'package:flutter/material.dart';

import 'package:market_check/config/menus/menu_categories.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';

class StoreCategoriesScreen extends StatelessWidget {
  static const String name = "store-categories-screen";
  const StoreCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStore = context.read<StoresProvider>().currentStore;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        title: Text(
          "Categorias",
          style: FontStyles.heading3(
            context,
            Color(currentStore!.titleColor),
          ),
        ),
        backgroundColor: Color(currentStore.color),
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: const _StoreItemsView(),
      bottomNavigationBar: const GoogleNavBar(),
    );
  }
}

class _StoreItemsView extends StatelessWidget {
  const _StoreItemsView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
    );
  }
}
