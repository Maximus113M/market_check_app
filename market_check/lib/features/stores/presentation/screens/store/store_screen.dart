import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_container.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  static const String name = 'store-view';
  final StoresProvider storesProvider;
  const StoreScreen({super.key, required this.storesProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          (storesProvider.currentStore!.poster == null)
              ? Image.asset(
                  'assets/Images/stores/establecimiento-base.jpg',
                  width: double.infinity,
                  height: ScreenSize.absoluteHeight * 0.33,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  height: ScreenSize.width * 0.7,
                  width: double.infinity,
                  child: FadeInImage(
                    placeholder: const AssetImage(AppAssets.loadingImage),
                    image: NetworkImage(
                      '${ServerUrls.currentImagesUrl}${storesProvider.currentStore!.poster!}',
                    ),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(
                      'assets/Images/stores/establecimiento-base.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Positioned(
            left: ScreenSize.width * 0.03,
            top: ScreenSize.absoluteHeight * 0.055,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(
                  ScreenSize.absoluteHeight * 0.007,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.text,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.appSecondary,
                  size: ScreenSize.absoluteHeight * 0.035,
                ),
              ),
            ),
          ),
          StoreContainer(
            store: context.watch<StoresProvider>().currentStore!,
          ),
        ],
      ),
    );
  }
}
