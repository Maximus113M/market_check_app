import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OfferView extends StatelessWidget {
  static const String name = '/offer-view';
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OfferBody(),
    );
  }
}

class OfferBody extends StatelessWidget {
  const OfferBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferModel offer = context.read<OffersProvider>().currentOffer!;
    return Stack(
      children: [
        Column(
          children: [
            Column(
              children: [
                Container(
                  height: ScreenSize.height * 0.55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 8,
                            offset: Offset(5, 5))
                      ]),
                  child: Hero(
                    tag: '${offer.id}',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: Image.network(
                        offer.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            offer.name,
                            style: FontStyles.heading1(AppColors.text),
                          ),
                        ],
                      ),
                      /* Row(
                        children: [
                          const Icon(Icons.monetization_on_sharp),
                          Text(
                            offer.price.toString(),
                            style: FontStyles.heading3(
                                AppColors.lightText),
                          ),
                        ],
                      ),*/
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Minim nulla ad incididunt aliqua ut labore tempor eiusmod veniam id labore. Nostrud sunt nulla magna anim esse sunt laboris commodo occaecat Lorem incididunt est. Proident officia quis nulla cillum nulla. officia quis nulla cillum nulla. officia quis nulla cillum nulla. ',
                          textAlign: TextAlign.center,
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 30,
          left: 0,
          child: IconButton.filled(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.black26),
            ),
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
        ),
        Positioned(
          top: ScreenSize.height * 0.51,
          right: 5,
          child: IconButton.filled(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.black26),
            ),
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ),
        Positioned(
            top: ScreenSize.height * 0.57,
            right: 30,
            child: const AddRemoveButton(count: 1)),
        Positioned(
          bottom: ScreenSize.height * 0.04,
          left: ScreenSize.height * 0.11,
          child: const FilledCustomButton(
              text: 'Añadir al Carrito',
              horizontalSize: 22,
              verticalSize: 20,
              color: AppColors.white,
              bgColor: AppColors.blueButton1,
              route: ''),
        ),
      ],
    );
  }
}
