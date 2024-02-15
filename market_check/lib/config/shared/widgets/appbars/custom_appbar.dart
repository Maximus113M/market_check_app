import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';

//import 'package:market_check/config/shared/widgets/side_menus/side_menu.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: ScreenSize.absoluteHeight * 0.07,
      backgroundColor: AppColors.appPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(right: ScreenSize.width * 0.12, bottom: 5),
        child: Image.asset(
          AppAssets.logoHorizontal,
          width: ScreenSize.height * 0.22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_rounded,
            size: 35,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}

AppBar customAppBar()=> AppBar(
      toolbarHeight: ScreenSize.absoluteHeight * 0.07,
      backgroundColor: AppColors.appPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(right: ScreenSize.width * 0.12, bottom: 5),
        child: Image.asset(
          AppAssets.logoHorizontal,
          width: ScreenSize.height * 0.22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_rounded,
            size: 33,
            color: AppColors.white,
          ),
        )
      ],
    );
