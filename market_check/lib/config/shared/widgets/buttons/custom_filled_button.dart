import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';

class FilledCustomButton extends StatelessWidget {
  final String text;
  final String? route;
  final double? horizontalSize;
  final double? verticalSize;
  final Color? color;
  final Color? bgColor;

  const FilledCustomButton({
    super.key,
    required this.text,
    this.horizontalSize,
    this.verticalSize,
    this.color,
    this.bgColor,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => route != null ? context.push(route!) : () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(bgColor ?? AppColors.blueButton),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalSize ?? 18, horizontal: horizontalSize ?? 85),
        child: Text(
          text,
          style: FontStyles.bodyBold1(context, color ?? AppColors.whiteBg),
        ),
      ),
    );
  }
}
