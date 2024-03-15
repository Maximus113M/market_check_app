import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/profile_cards/presentation/providers/profile_cards_provider.dart';

import 'package:provider/provider.dart';

class OfferDetailsModal extends StatelessWidget {
  static const name = "offer-details";
  final ProfileCardsProvider profileCardsProvider;

  const OfferDetailsModal({super.key, required this.profileCardsProvider});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
      child: OfferDetailsModalContent(
          offer: context.read<StoresProvider>().currentOffer!),
    );
  }
}

class OfferDetailsModalContent extends StatelessWidget {
  final OfferModel offer;

  const OfferDetailsModalContent({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.absoluteHeight * 0.6,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.width * 0.08),
              ),
            ),
            child: FadeInImage(
              placeholder: const AssetImage(AppAssets.offers),
              image: NetworkImage(
                  '${ServerUrls.currentImagesUrl}${offer.imagePath}'),
              fit: BoxFit.cover,
              height: ScreenSize.absoluteHeight * 0.4,
              width: double.infinity,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.35),
            height: ScreenSize.absoluteHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(width: 2, color: AppColors.disabled),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.width * 0.08),
              ),
              boxShadow: AppShadows.profileShadow,
              color: AppColors.white,
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenSize.absoluteHeight * 0.01,
                  ),
                  child: Text(
                    offer.name,
                    style: FontStyles.heading8(AppColors.appSecondary),
                  ),
                ),
                Text(
                  '${offer.dateStart} - ${offer.dateEnd}',
                  style: FontStyles.bodyBold2(AppColors.text),
                ),
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
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.02,
            right: ScreenSize.width * 0.04,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.width * 0.02),
                ),
                color: AppColors.text,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.height * 0.005,
                    horizontal: ScreenSize.width * 0.022),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${offer.dateStart}',
                      style: TextStyle(
                        fontSize: ScreenSize.width * 0.038,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      AppFunctions.getMonthFormated(offer.dateStart),
                      style: TextStyle(
                        fontSize: ScreenSize.width * 0.028,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
