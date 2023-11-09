import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';

class FontStyles {
  static const double sp40 = .100;
  static const double sp36 = .087;
  static const double sp32 = .08;
  static const double sp24 = .059;
  static const double sp22 = .055;
  static const double sp20 = .052;
  static const double sp16 = .041;
  static const double sp14 = .036;
  static const double sp12 = .032;
  static const double sp10 = .026;

  static TextStyle heading0(
    BuildContext context,
    Color color,
  ) =>
      TextStyle(
          color: color,
          fontSize: ScreenSize.width * sp40,
          fontWeight: FontWeight.w700,
          fontFamily: 'CustomFont');

  static TextStyle heading1(BuildContext context, Color color) => TextStyle(
      color: color,
      fontSize: ScreenSize.width * sp36,
      fontWeight: FontWeight.w700,
      fontFamily: 'CustomFont');

  static TextStyle heading2(BuildContext context, Color color) => TextStyle(
      color: color,
      fontSize: ScreenSize.width * sp32,
      fontWeight: FontWeight.w700,
      fontFamily: 'CustomFont');

  static TextStyle heading3(BuildContext context, Color color) => TextStyle(
      color: color,
      fontSize: ScreenSize.width * sp24,
      fontWeight: FontWeight.w700,
      fontFamily: 'CustomFont');

  static TextStyle heading4(BuildContext context, Color color) => TextStyle(
      color: color,
      fontSize: ScreenSize.width * sp22,
      fontWeight: FontWeight.w700,
      fontFamily: 'CustomFont');

  static TextStyle subtitle1(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle subtitle2(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle body1(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle body2(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle body3(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp12,
        fontWeight: FontWeight.w400,
      );
  static TextStyle bodyBold1(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle bodyBold2(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp14,
        fontWeight: FontWeight.w600,
      );
  static TextStyle bodyBold3(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp12,
        fontWeight: FontWeight.w600,
      );
  static TextStyle caption(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp10,
        fontWeight: FontWeight.w400,
      );
  static TextStyle captionBold(BuildContext context, Color color) => TextStyle(
        color: color,
        fontSize: ScreenSize.width * sp10,
        fontWeight: FontWeight.w600,
      );
}
