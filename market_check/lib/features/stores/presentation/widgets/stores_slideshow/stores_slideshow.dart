import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

/*final List<String> stores = [
  "assets/Images/Almacenes_exito.png",
  "assets/Images/LogoD1.png",
  "assets/Images/LOGO-LACANASTA.jpg",
  "assets/Images/masXmenos-logo.png",
  "assets/Images/logo-ara.png",
];*/

class StoresSlideShow extends StatelessWidget {
  final List<StoreModel> stores;

  const StoresSlideShow({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.54,
        scale: 0.7,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: stores.length,
        itemBuilder: (context, index) =>
            _Slice(storePoster: stores[index].poster),
        onTap: (index) => context.push('/stores'),
      ),
    );
  }
}

class _Slice extends StatelessWidget {
  final String storePoster;
  const _Slice({required this.storePoster});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FadeIn(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "${RemoteUrls.currentImagesUrl}$storePoster",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(AppAssets.loadingImage),
          ),
        ),
      ),
    );
  }
}
