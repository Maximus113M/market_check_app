import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_container_screen.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  static const String name = 'store-view';
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreModel store = context.read<StoresProvider>().currentStore!;
    return Scaffold(
      body: Stack(
        children: [
          (store.poster == null)
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
                    placeholder: AssetImage(AppAssets.loadingImage),
                    image: NetworkImage(
                      '${RemoteUrls.currentImagesUrl}${store.poster!}',
                    ),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) => 
                    Image.asset('assets/Images/stores/establecimiento-base.jpg',
                    fit: BoxFit.cover,)
                  ),
              ),
          const StoreContainerScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(
          Icons.home,
          size: 30,
          color: AppColors.appPrimary,
        ),
      ),
    );
  }
}
