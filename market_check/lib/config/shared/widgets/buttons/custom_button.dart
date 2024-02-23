import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  final double horizontalMargin;
  final double verticalSize;
  final double radius;
  final Color? color;
  final Color? bgColor;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.action,
    this.horizontalMargin = 0.1,
    this.verticalSize = 0.055,
    this.radius = 0.03,
    this.color,
    this.bgColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        height: ScreenSize.absoluteHeight * verticalSize,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: ScreenSize.width * horizontalMargin),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.appSecondary,
          borderRadius: BorderRadius.circular(ScreenSize.width * radius),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ?? FontStyles.bodyBold1(color ?? AppColors.white),
          ),
        ),
      ),
    );
  }
}
