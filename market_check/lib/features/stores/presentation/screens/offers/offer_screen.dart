import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/offer_swiper.dart';
import 'package:market_check/features/categories/presentation/screens/categories_screen.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OfferScreen extends StatelessWidget {
  static const name = "offers-m";
  final ProductsProvider productsProvider;

  const OfferScreen({super.key, required this.productsProvider});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: Text(
            'Categorías y Productos',
            style: FontStyles.subtitle0(AppColors.appSecondary),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appSecondary,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            context.watch<StoresProvider>().offerList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Descuentos',
                        style: FontStyles.subtitle0(AppColors.appPrimary),
                      ),
                      OffersSwiper(
                        offerList: context.watch<StoresProvider>().offerList,
                      ),
                    ],
                  )
                : const SizedBox(),
            TabBar(
              onTap: (value) {
                if (value == 0) {
                  productsProvider.setCurrentSearchType(SearchType.categories);
                }
              },
              tabs: const [
                Tab(text: "Categorias"),
                Tab(text: "Productos"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CategoriesScreen(
                    categoriesList:
                        context.watch<CategoriesProvider>().categories,
                  ),
                  ProductsScreen(
                    productsList:
                        context.watch<ProductsProvider>().filteredProductsList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
