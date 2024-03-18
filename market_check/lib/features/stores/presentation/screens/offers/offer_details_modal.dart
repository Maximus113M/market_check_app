import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/offer_model.dart';
import 'package:market_check/features/products/data/models/product_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OfferDetailsModal extends StatelessWidget {
  const OfferDetailsModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
      child: OfferDetailsModalContent(
        offer: context.read<StoresProvider>().currentOffer!,
        offerProducts: context.watch<StoresProvider>().offerProducts,
      ),
    );
  }
}

class OfferDetailsModalContent extends StatelessWidget {
  final OfferModel offer;
  final List<ProductModel> offerProducts;

  const OfferDetailsModalContent(
      {super.key, required this.offer, required this.offerProducts});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.absoluteHeight * 0.55,
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
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize.absoluteHeight * 0.01,
            ),
            height: ScreenSize.absoluteHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.disabled,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenSize.width * 0.07),
              ),
              boxShadow: AppShadows.profileShadow,
              color: const Color.fromARGB(255, 241, 239, 239),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      offer.name,
                      style: FontStyles.bodyBold0(AppColors.text),
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.84,
                      child: Text(
                        offer.description,
                        style: FontStyles.body4(AppColors.text),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenSize.absoluteHeight * 0.01,
                      ),
                      child: Text(
                        'Productos',
                        style: FontStyles.bodyBold0(AppColors.text),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        offerProducts.length,
                        (index) => Chip(
                          padding: const EdgeInsets.all(6),
                          side: const BorderSide(color: AppColors.appSecondary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: MaterialStatePropertyAll(
                            AppColors.appSecondary.withOpacity(0.7),
                          ),
                          label: Text(
                            offerProducts[index].name,
                            style: FontStyles.bodyBold3(AppColors.text),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.015,
            left: ScreenSize.width * 0.035,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(ScreenSize.width * 0.02),
                ),
                color: AppColors.text,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.height * 0.01,
                    horizontal: ScreenSize.width * 0.035),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${offer.dateStart.day}',
                          style: FontStyles.bodyBold1(AppColors.white)
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          ' - ${offer.dateEnd.day}',
                          style: FontStyles.bodyBold1(AppColors.white)
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Text(
                      AppFunctions.mothNameMap[offer.dateEnd.month] ?? '',
                      style: FontStyles.bodyBold3(AppColors.white)
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.016,
            right: ScreenSize.width * 0.038,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.text,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
