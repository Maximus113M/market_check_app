import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';

class OffersListview extends StatelessWidget {
  final List<OfferModel> offerList;
  const OffersListview({super.key, required this.offerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        viewportFraction: 0.7,
        scale: 0.6,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
              activeColor: Colors.transparent, color: Colors.transparent),
        ),
        itemCount: offerList.length,
        itemBuilder: (context, index) {
          final offer = offerList[index];
          return OfferListContent(
            offerModel: offer,
          );
        },
      ),
    );
  }
}

class OfferListContent extends StatelessWidget {
  final OfferModel offerModel;
  const OfferListContent({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: AppColors.appGray),
        ),
        child: Image.network(
          '${RemoteUrls.currentImagesUrl}${offerModel.imagePath}',
          height: 150,
          width: 400,
          //fit: BoxFit.cover,
        ),
      ),
    );
  }
}
