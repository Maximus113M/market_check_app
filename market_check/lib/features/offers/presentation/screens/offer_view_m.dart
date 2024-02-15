import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  const OfferScreeenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar()
    );
  }
}
