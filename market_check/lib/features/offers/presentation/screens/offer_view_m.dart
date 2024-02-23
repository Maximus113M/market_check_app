import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';
import 'package:market_check/features/categories/presentation/screens/categories_screen.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/offers/presentation/widgets/offer_swiper.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';

import 'package:provider/provider.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  const OfferScreeenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Descuentos',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          OffersSwiper(
            offerList: context.watch<OffersProvider>().offerList,
          ),
          //const SearchProducts(),
          ElevatedButton(
            onPressed: () {
              context.read<ProductsProvider>().getProductsByStore(context);
              context.push("/products-view");
            },
            child: const Text('Productos'),
          ),
          Expanded(
            child: CategoriesScreen(
                categoriesList: context.read<CategoriesProvider>().categories),
          ),
        ],
      ),
    );
  }
}
