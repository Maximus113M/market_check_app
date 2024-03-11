import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_info_screen_body.dart';
import 'package:provider/provider.dart';

class StoreInfoScreen extends StatelessWidget {
  static const String name = '/store-info';

  const StoreInfoScreen({super.key});

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
            )),
        title: Text(
          'Acerca de nosotros',
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
      ),
      body: StoreInfoScreenBody(
        store: context.read<StoresProvider>().currentStore!,
      ),
    );
  }
}
