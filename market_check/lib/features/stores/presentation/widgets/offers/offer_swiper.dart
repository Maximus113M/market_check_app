import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/presentation/widgets/offers/offer_swiper_content.dart';

class OffersSwiper extends StatelessWidget {
  final List<OfferModel> offerList;
  const OffersSwiper({super.key, required this.offerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.absoluteHeight * 0.2,
      child: Swiper(
        viewportFraction: 0.9,
        scale: 0.6,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.transparent,
            color: Colors.transparent,
          ),
        ),
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          final offer = offerList[index];
          return OfferSwiperContent(
            offerModel: offer,
          );
        },
      ),
    );
  }
}
