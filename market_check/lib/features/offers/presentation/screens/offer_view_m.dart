import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/main_screen/presentation/screens/widgets/bottom_navigation.dart';

class OfferScreeenM extends StatelessWidget {
  static const name = "offers-m";
  const OfferScreeenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.logoHorizontalColor,
          width: ScreenSize.height * 0.7,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_rounded,
                size: 40,
              ))
        ],
      ),

      bottomNavigationBar: const BottomMenu(),
    );
  }
}

