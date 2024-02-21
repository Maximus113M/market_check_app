import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_screen_body.dart';

class StoresScreenM extends StatelessWidget {
  static const String name = 'stores-m';
  const StoresScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: StoresScreenBody(),
    );
  }
}
