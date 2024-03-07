import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market_check/config/utils/utils.dart';

class Loadings {
  Loadings._();

  static Center lottieLoading() => Center(
        child: SizedBox(
          height: ScreenSize.absoluteHeight * 0.28,
          child: Lottie.asset(AppAssets.loadingLottie),
        ),
      );
}
