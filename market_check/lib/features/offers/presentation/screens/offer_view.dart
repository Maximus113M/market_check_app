import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

import 'package:go_router/go_router.dart';

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
    return Stack(
      children: [
        Column(
          children: [
            Column(
              children: [
                Container(
                  height: ScreenSize.height(context) * 0.55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteBg,
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
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: Image.asset(
                      AppAssets.offerReference,
                      fit: BoxFit.cover,
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
                            'Promo 2 x 1',
                            style: FontStyles.heading1(context, AppColors.text),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.monetization_on_sharp),
                          Text(
                            '128.000',
                            style: FontStyles.heading2(
                                context, AppColors.lightText),
                          ),
                        ],
                      ),
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
          top: ScreenSize.height(context) * 0.51,
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
          top: ScreenSize.height(context) * 0.57,
          right: 30,
          child: Container(
            height: 40,
            width: 108,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.lightText,
                      size: 18,
                    ),
                    onPressed: () {}),
                Text(
                  '1',
                  style: FontStyles.bodyBold1(context, AppColors.text),
                ),
                IconButton.filled(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black26),
                    ),
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.whiteBg,
                      size: 18,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: ScreenSize.height(context) * 0.07,
          left: ScreenSize.height(context) * 0.11,
          child: FilledCustomButton(
              text: 'Añadir al Carrito',
              horizontalSize: 22,
              verticalSize: 20,
              color: AppColors.whiteBg,
              bgColor: Colors.blue.shade800,
              route: ''),
        ),
      ],
    );
  }
}
