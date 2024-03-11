import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/scanner/presentation/providers/scanner_provider.dart';

class ScannerBodyScreen extends StatelessWidget {
  final ScannerProvider scannerProvider;

  const ScannerBodyScreen({super.key, required this.scannerProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.1,
              vertical: ScreenSize.absoluteHeight * 0.01),
          child: Text(
            'Escanea el codigo de barras del producto para obtener informacion o agregarlo a tu carrito de compras.',
            style: FontStyles.bodyBold1(AppColors.lightText),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenSize.absoluteHeight * 0.05,
              bottom: ScreenSize.absoluteHeight * 0.2),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: ScreenSize.absoluteHeight * 0.35,
                child: Image.asset(
                  AppAssets.scanner2,
                ),
              ),
              Container(
                height: ScreenSize.absoluteHeight * 0.35,
                width: double.infinity,
                color: AppColors.white.withOpacity(0.6),
              )
            ],
          ),
        ),
        CustomButton(
          textStyle: FontStyles.bodyBold0(AppColors.appPrimary),
          horizontalMargin: 0.14,
          verticalSize: 0.065,
          text: 'ESCANEAR CÓDIGO',
          radius: 0.07,
          action: () {
            scannerProvider.getProductByScanner(context);
          },
        ),
      ],
    );
  }
}
