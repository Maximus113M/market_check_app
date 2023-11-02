import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';

class LoginCustomButton extends StatelessWidget {
  final String text;
  final String route;
  final double horizontalSize;
  final double verticalSize;
  final Color color;
  final bool? validator;

  const LoginCustomButton({
    super.key,
    required this.text,
    required this.horizontalSize,
    required this.verticalSize,
    required this.color,
    required this.route,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push('/home'),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalSize, horizontal: horizontalSize),
        child: Text(
          text,
          style: FontStyles.bodyBold1(context, AppColors.whiteBg),
        ),
      ),
    );
  }
}
