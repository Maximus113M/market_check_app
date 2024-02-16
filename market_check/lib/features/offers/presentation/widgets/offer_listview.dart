import 'package:flutter/material.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';

class OffersListview extends StatelessWidget {
  final List<OfferModel> offerList;
  const OffersListview({super.key, required this.offerList});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
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
    return Container(
      width: 175,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: //Image.network('${RemoteUrls.currentImagesUrl}${offerModel.imagePath}'),
      Text('hola como estas')
    );
  }
}
