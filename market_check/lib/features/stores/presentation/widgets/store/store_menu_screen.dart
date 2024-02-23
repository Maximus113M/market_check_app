import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:provider/provider.dart';

class StoreMenuScreen extends StatelessWidget {
  const StoreMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.04),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.category_rounded,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Categorias'),
              subtitle: const Text('Explora nuestras ofertas y categorias'),
              trailing: IconButton(
                  onPressed: () {
                    context.read<OffersProvider>().loadOffers(context);
                    context.read<CategoriesProvider>().getCategories(context);
                    context.push('/offers-m');
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  )),
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
                  const Text('¡Consulta lo productos antes de llevarlos!'),
              trailing: IconButton(
                onPressed: () {
                  context.push('/scanner');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.list_rounded,
                size: 35,
                color: AppColors.appPrimary,
              ),
              title: const Text('Crea tus listas'),
              subtitle: const Text(
                  'Encuentra en nuestros productos lo que necesitas'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
