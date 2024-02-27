import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/stores/presentation/screens/offers/widgets/offer_swiper.dart';
import 'package:market_check/features/categories/presentation/screens/categories_screen.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  final List<OfferModel> offers;

  const OfferScreeenM({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          leading: IconButton(
            onPressed: () => context.push('/store-view'),
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
                context.read<ProductsProvider>().restartFilterList();
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
                          context.watch<CategoriesProvider>().categories),
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
