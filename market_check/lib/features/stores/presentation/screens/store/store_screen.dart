import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_container_screen.dart';

import 'package:go_router/go_router.dart';

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
          const StoreContainerScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appPrimary,
        onPressed: () => context.pop(),
        child: const Icon(
          Icons.home,
          size: 30,
          color: AppColors.appSecondary,
        ),
      ),
    );
  }
}
