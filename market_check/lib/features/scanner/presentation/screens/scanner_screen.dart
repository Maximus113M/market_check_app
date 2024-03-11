import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/scanner/presentation/providers/scanner_provider.dart';
import 'package:market_check/features/scanner/presentation/widgets/scanner_body_screen.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ScannerScreen extends StatelessWidget {
  static const String name = '/scanner';

  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        leading: IconButton(
            onPressed: () {
              context.read<ScannerProvider>().clearCurrentProduct();
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appSecondary,
            )),
        context: context,
        title: Text(
          'Escaneo de productos',
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
      ),
      body: ScannerBodyScreen(
        scannerProvider: Provider.of<ScannerProvider>(context),
      ),
    );
  }
}
