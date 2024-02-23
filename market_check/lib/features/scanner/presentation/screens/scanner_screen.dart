import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/scanner/presentation/providers/scanner_provider.dart';
import 'package:market_check/features/scanner/presentation/widgets/scanner_body_screen.dart';
import 'package:provider/provider.dart';

class ScannerScreen extends StatelessWidget {
  static const String name = '/scanner';

  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
          context: context,
          title: Text(
            'Escaneo de Productos',
            style: FontStyles.heading11(AppColors.white),
          )),
      body: ScannerBodyScreen(
        scannerProvider: Provider.of<ScannerProvider>(context),
      ),
    );
  }
}
