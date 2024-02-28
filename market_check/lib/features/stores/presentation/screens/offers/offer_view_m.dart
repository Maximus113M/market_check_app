import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/offer_swiper.dart';
import 'package:market_check/features/categories/presentation/screens/categories_screen.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  final List<OfferModel> offers;
  final ProductsProvider productsProvider;

  const OfferScreeenM(
      {super.key, required this.offers, required this.productsProvider});

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
            const SizedBox(height: 10),
            if (offers.isNotEmpty)
              const Center(
                child: Text(
                  'Descuentos',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            if (offers.isNotEmpty)
              OffersSwiper(
                offerList: offers,
              ),

            TabBar(
              onTap: (value) {
                if (value == 0) {
                  productsProvider.setCurrentSearchType(SearchType.categories);
                } else {
                  productsProvider.restartProductList();
                  productsProvider.setCurrentSearchType(SearchType.products);
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

            //const SearchProducts(),
            /*ElevatedButton(
              onPressed: () {
                context.read<ProductsProvider>().getProductsByStore(context);
                context.push("/products-view");
              },
              child: const Text('Productos'),
            ),*/
          ],
        ),
      ),
    );
  }
}