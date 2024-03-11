import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/profile_cards/presentation/providers/profile_cards_provider.dart';
import 'package:market_check/features/profile_cards/presentation/widgets/shopping_history/shopping_history_screen_body.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ShoppingHistoryScreen extends StatelessWidget {
  static const String name = "history-screen";

  const ShoppingHistoryScreen({super.key});

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
        isCartVisible: false,
        title: Text(
          "Historial de Compra",
          style: FontStyles.subtitle0(AppColors.appSecondary),
        ),
      ),
      body: ShoppingHistoryScreenBody(
        profileCardsProvider: Provider.of<ProfileCardsProvider>(context),
      ),
    );
  }
}
