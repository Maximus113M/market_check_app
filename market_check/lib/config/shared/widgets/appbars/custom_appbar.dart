import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';

import 'package:go_router/go_router.dart';
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
        padding: EdgeInsets.only(right: ScreenSize.width * 0.10, bottom: 5),
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
            size: 3,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}

AppBar customAppBar(
        {Widget? leading,
        bool isCartVisible = true,
        Widget? title,
        bool isCenterTitle = true,
        required BuildContext context}) =>
    AppBar(
      leading: leading,
      toolbarHeight: ScreenSize.absoluteHeight * 0.07,
      backgroundColor: AppColors.appPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      elevation: 10,
      shadowColor: AppColors.text,
      centerTitle: isCenterTitle,
      title: title ??
          Padding(
            padding: EdgeInsets.only(right: ScreenSize.width * 0.15),
            child: Image.asset(
              AppAssets.logoHorizontal,
              width: ScreenSize.height * 0.22,
            ),
          ),
      actions: [
        if (isCartVisible)
          Padding(
            padding: EdgeInsets.only(right: ScreenSize.width * 0.005),
            child: IconButton(
              onPressed: () => context.pushNamed(ShoppingCartScreen.name),
              icon: const Icon(
                Icons.shopping_cart_rounded,
                size: 30,
                color: AppColors.white,
              ),
            ),
          )
      ],
    );
