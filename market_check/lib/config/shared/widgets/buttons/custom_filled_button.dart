import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/config/utils/screen_size.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;
  final String? route;
  final double horizontalSize;
  final double verticalSize;
  final Color? color;
  final Color? bgColor;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.action,
    this.horizontalSize = 0.3,
    this.verticalSize = 0.017,
    this.color,
    this.bgColor,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => action != null
          ? {action!()}
          : route != null
              ? context.push(route!)
              : () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(bgColor ?? AppColors.blueButton1),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ScreenSize.absoluteHeight * verticalSize,
            horizontal: ScreenSize.width * horizontalSize),
        child: Text(
          text,
          style: FontStyles.bodyBold1(color ?? AppColors.white),
        ),
      ),
    );
  }
}
