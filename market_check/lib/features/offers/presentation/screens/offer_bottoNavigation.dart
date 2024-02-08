import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 25,
          offset: Offset(8, 20),
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.appPrimary,
            selectedItemColor: AppColors.appGray,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: LottieBuilder.asset(
                    AppAssets.iconoLottieHome,
                    height: 20,
                  ),
                  label: 'inicio'),
              BottomNavigationBarItem(
                  icon: LottieBuilder.asset(AppAssets.iconoLottieStore, height: 20,),
                  label: 'Tiendas'
                  ),
              BottomNavigationBarItem(
                  icon: LottieBuilder.asset(AppAssets.iconoLottieList, height: 20,),
                  label: 'Listas'),
              BottomNavigationBarItem(
                  icon: LottieBuilder.asset(AppAssets.iconoLottieProfile, height: 20,),
                  label: 'Mi cuenta'),
            ]),
      ),
    );
  }
}
