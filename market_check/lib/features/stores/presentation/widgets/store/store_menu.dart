import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/stores/presentation/screens/store/store_info_screen.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StoreMenu extends StatelessWidget {
  final int descriptionLength;
  const StoreMenu({super.key, required this.descriptionLength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenSize.absoluteHeight *
            (descriptionLength < 100
                ? 0.06
                : descriptionLength < 250
                    ? 0.05
                    : 0.03),
        bottom: ScreenSize.absoluteHeight * 0.01,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.read<StoresProvider>().loadOffers(context);
              context.read<CategoriesProvider>().getCategories(context);
              context.read<ProductsProvider>().getProductsByStore(context);

              context.push('/offers-m');
            },
            child: listTileOption(
              leading: Icons.category_rounded,
              title: 'Productos y Categorias',
              subtitle: 'Explora nuestras ofertas, productos y categorias.',
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(ScannerScreen.name),
            child: listTileOption(
              leading: Icons.qr_code_scanner_rounded,
              title: 'Escanea productos',
              subtitle: '¡Consulta los productos antes de llevarlos!',
            ),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(StoreInfoScreen.name),
            child: listTileOption(
              leading: Icons.info_outlined,
              title: 'Acerca de nosotros',
              subtitle: 'Información legal y de contacto.',
            ),
          ),
        ],
      ),
    );
  }

  ListTile listTileOption({
    required IconData leading,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(
        leading,
        size: 35,
        color: AppColors.appSecondary,
      ),
      title: Text(
        title,
        style: FontStyles.bodyBold0(AppColors.text),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.text),
      ),
      trailing: const Icon(
        Icons.arrow_circle_right_outlined,
        size: 30,
      ),
    );
  }
}
