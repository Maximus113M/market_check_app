import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';

import 'package:go_router/go_router.dart';

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
