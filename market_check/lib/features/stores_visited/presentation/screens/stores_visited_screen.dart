import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores_visited/presentation/widgets/stores_visited_screen_body.dart';

class StoresVisitedScreen extends StatelessWidget {
  static const String name = '/stores-visited';
  const StoresVisitedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
        title: Text(
          'Tiendas Visitadas',
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
        isCartVisible: false,
      ),
      body: const StoresVisitedScreenBody(),
    );
  }
}
