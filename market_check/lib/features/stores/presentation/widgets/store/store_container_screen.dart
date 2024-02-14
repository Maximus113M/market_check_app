import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';

class StoreContainerScreen extends StatelessWidget {
  const StoreContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.3),
      padding: EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.03, horizontal: ScreenSize.width * 0.05),
      decoration: const BoxDecoration(
        color: AppColors.appGray,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
      ),
      child: const Column(
        children: [
          Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.'),

        ],
      ),
    );
  }
}