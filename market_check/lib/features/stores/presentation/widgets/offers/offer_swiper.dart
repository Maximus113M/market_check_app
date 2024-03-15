import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/offer_swiper_content.dart';

import 'package:provider/provider.dart';

class OffersSwiper extends StatelessWidget {
  final List<OfferModel> offerList;
  const OffersSwiper({super.key, required this.offerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.absoluteHeight * 0.16,
      child: Swiper(
        viewportFraction: 0.7,
        scale: 0.7,
        autoplay: true,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.transparent,
            color: Colors.transparent,
          ),
        ),
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<StoresProvider>().currentOffer = offerList[index];
              context
                  .read<StoresProvider>()
                  .getOfferProducts(offerList[index].id!);
              context.read<StoresProvider>().showOfferDetailsModal(context);
            },
            child: OfferSwiperContent(
              offerModel: offerList[index],
            ),
          );
        },
      ),
    );
  }
}
