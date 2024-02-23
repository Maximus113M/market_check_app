import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/scanner/presentation/providers/scanner_provider.dart';

class ScannerBodyScreen extends StatelessWidget {
  final ScannerProvider scannerProvider;

  const ScannerBodyScreen({super.key, required this.scannerProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.1),
            child: SizedBox(
              child: Icon(
                Icons.qr_code_scanner_rounded,
                size: ScreenSize.absoluteHeight * 0.5,
                color: AppColors.text.withOpacity(0.4),
              ),
            ),
          ),
          CustomButton(
              textStyle: FontStyles.subtitle1(AppColors.white),
              horizontalMargin: 0.18,
              verticalSize: 0.065,
              text: 'Escanea el Codigo',
              action: () async {
                scannerProvider.getProductByScanner(context);
              }),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Producto : ${scannerProvider.scanBarCode}\n',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
