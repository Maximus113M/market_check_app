import 'package:flutter/material.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';

class OfferSwiperContent extends StatelessWidget {
  final OfferModel offerModel;
  const OfferSwiperContent({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Image.network(
          '${ServerUrls.currentImagesUrl}${offerModel.imagePath}',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
