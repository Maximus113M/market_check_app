import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/offer_swiper.dart';
import 'package:market_check/features/categories/presentation/screens/categories_screen.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';

import 'package:provider/provider.dart';

class OfferDetailsScreen extends StatelessWidget {
  static const name = "offer-details";
  final ProductsProvider productsProvider;

  const OfferDetailsScreen({super.key, required this.productsProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeInImage(
            placeholder: AssetImage(AppAssets.stores),
            image: NetworkImage(''),
          ),
          Container(),
        ],
      ),
    );
  }
}
