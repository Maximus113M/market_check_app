import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_check/config/services/server/server_urls.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
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
        body: OfferDetailsScreenBody(
            offer: context.read<StoresProvider>().currentOffer!));
  }
}

class OfferDetailsScreenBody extends StatelessWidget {
  final OfferModel offer;

  const OfferDetailsScreenBody({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(ScreenSize.width * 0.1),
                bottomRight: Radius.circular(ScreenSize.width * 0.1),
              ),
              boxShadow: AppShadows.profileShadow,
              color: AppColors.white,
            ),
            child: FadeInImage(
              placeholder: const AssetImage(AppAssets.offers),
              image: NetworkImage(
                  '${ServerUrls.currentImagesUrl}${offer.imagePath}'),
              fit: BoxFit.cover,
              height: ScreenSize.absoluteHeight * 0.43,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenSize.absoluteHeight * 0.01,
            ),
            child: Text(
              offer.name,
              style: FontStyles.heading8(AppColors.appSecondary),
            ),
          ),
          Text('${offer.dateStart} - ${offer.dateEnd}', style: FontStyles.bodyBold2(AppColors.text),),
          SizedBox(
            width: ScreenSize.width * 0.84,
            child: Text(
              offer.description,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize.absoluteHeight * 0.01,
            ),
            child: Text(
              'Productos con descuento',
              style: FontStyles.subtitle1(AppColors.text),
            ),
          ),
          Wrap(
            children: [
              Text('Arroz '),
              Text('Arroz '),
              Text('Arroz '),
              Text('Arroz '),
              Text('Arroz '),
              Text('Arroz '),
              Text('Arroz '),
            ],
          )
        ],
      ),
    );
  }
}
