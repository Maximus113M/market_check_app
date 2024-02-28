import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/config/utils/screen_size.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback action;
  final double horizontalSize;
  final double verticalSize;
  final double fontSize;
  final Color? color;
  final Color? bgColor;
  final double radius;

  const CustomFilledButton(
      {super.key,
      required this.text,
      required this.action,
      this.horizontalSize = 0.03,
      this.verticalSize = 0.012,
      this.fontSize = 0,
      this.color,
      this.bgColor,
      this.radius = 0.1});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => action(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(bgColor ?? AppColors.blueButton1),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenSize.width * radius),
          ),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
              vertical: ScreenSize.absoluteHeight * verticalSize,
              horizontal: ScreenSize.width * horizontalSize),
        ),
      ),
      child: Text(
        text,
        style: FontStyles.bodyBold2(color ?? AppColors.white),
      ),
    );
  }
}
