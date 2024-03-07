import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';

class NotFoundPlaceHolder extends StatelessWidget {
  final IconData? icon;
  final double iconSize;
  final Color? color;
  final String text;
  final double bottomSpacing;

  const NotFoundPlaceHolder({
    super.key,
    this.icon,
    this.iconSize= 0.18,
    this.color,
    required this.text,
    this.bottomSpacing= 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon?? Icons.travel_explore,
          size: ScreenSize.absoluteHeight * iconSize,
          color: color?? AppColors.disabled,
        ),
        Text(
          text,
          style: FontStyles.bodyBold0(AppColors.disabled),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: ScreenSize.absoluteHeight * bottomSpacing,
        )
      ],
    );
  }
}
