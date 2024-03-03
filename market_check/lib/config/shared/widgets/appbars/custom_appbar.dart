import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_badge_icon.dart';
import 'package:market_check/features/shopping/presentation/providers/shopping_provider.dart';

import 'package:provider/provider.dart';

AppBar customAppBar({
  Widget? leading,
  bool isCartVisible = true,
  Widget? title,
  bool isCenterTitle = true,
  required BuildContext context,
}) =>
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
            padding: EdgeInsets.only(right: ScreenSize.width * 0.01),
            child: Image.asset(
              AppAssets.logoHorizontal,
              width: ScreenSize.height * 0.22,
            ),
          ),
      actions: [
        if (isCartVisible)
          Padding(
            padding: EdgeInsets.only(right: ScreenSize.width * 0.005),
            child: CustomBadge(
              icon: Icons.shopping_cart_rounded,
              iconSize: 30,
              counter: context.watch<ShoppingProvider>().shoppingItemsCount(),
              color: AppColors.white,
              route: ShoppingCartScreen.name,
            ),
          )
      ],
    );
