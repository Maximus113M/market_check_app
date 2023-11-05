import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';

class FilledCustomButton extends StatelessWidget {
  final String text;
  final String route;
  final double horizontalSize;
  final double verticalSize;
  final Color color;
  final Color bgColor;
  final Function? validator;

  const FilledCustomButton({
    super.key,
    required this.text,
    required this.horizontalSize,
    required this.verticalSize,
    required this.color,
    required this.bgColor,
    required this.route,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.push(route),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
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
          style: FontStyles.bodyBold1(context, color),
        ),
      ),
    );
  }
}
