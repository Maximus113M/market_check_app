import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/main_screen/presentation/screens/widgets/bottom_navigation.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_listview_m.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_screen_body.dart';
import 'package:provider/provider.dart';

class StoresScreenM extends StatelessWidget {
  static const String name = 'stores-m';
  //final StoresProvider storesProvider;
  const StoresScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: StoresScreenBody()
    );
  }
}
