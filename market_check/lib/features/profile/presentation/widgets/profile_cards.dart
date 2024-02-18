import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/utils/constans/app_shadows.dart';

class ProfileCards extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;

  const ProfileCards({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: AppShadows.mainShadow,
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(10),
              child: FadeInImage(
                height: ScreenSize.absoluteHeight * 0.18,
                width: ScreenSize.width * 0.3,
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ),
                placeholder: const AssetImage(AppAssets.loadingImage),
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                  AppAssets.loadingImage,
                  height: ScreenSize.absoluteHeight * 0.18,
                  width: ScreenSize.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: ScreenSize.absoluteHeight * 0.18,
            width: ScreenSize.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: AppColors.gradientProfileCards,
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: ScreenSize.width * 0.3,
              child: Text(
                title,
                style: FontStyles.bodyBold0(AppColors.white),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
