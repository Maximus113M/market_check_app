import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StoreMenuScreen extends StatelessWidget {
  const StoreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.04),
        child: Column(
          children: [
            GestureDetector(
              //TODO REVISAR ESTO ?????
              onTap: () {
                context.read<StoresProvider>().loadOffers(context);
                context.read<CategoriesProvider>().getCategories(context);
                context.read<ProductsProvider>().getProductsByStore(context);
                context.push('/offers-m');
              },
              child: ListTile(
                leading: const Icon(
                  Icons.category_rounded,
                  size: 35,
                  color: AppColors.appPrimary,
                ),
                title: const Text('Productos y Categorias'),
                subtitle: const Text(
                    'Explora nuestras ofertas, productos y categorias'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<StoresProvider>().loadOffers(context);
                    context.read<CategoriesProvider>().getCategories(context);
                    context
                        .read<ProductsProvider>()
                        .getProductsByStore(context);

                    context.push('/offers-m');
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.qr_code_scanner_rounded,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Escanea productos'),
              subtitle:
                  const Text('¡Consulta los productos antes de llevarlos!'),
              trailing: IconButton(
                onPressed: () => context.pushNamed(ScannerScreen.name),
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
