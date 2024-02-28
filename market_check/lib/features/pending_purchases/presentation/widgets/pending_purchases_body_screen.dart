import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/pending_purchases/presentation/widgets/pending_purchases_item.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:provider/provider.dart';

class PendingPurchasesBodyScreen extends StatelessWidget {
  final SignInProvider signInProvider;
  const PendingPurchasesBodyScreen({super.key, required this.signInProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'COMPRAS PENDIENTES',
            style: FontStyles.subtitle0(AppColors.appPrimary),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
          child: PendingPurchasesItem(
            purchase: signInProvider.openPurchases,
            stores: context.watch<StoresProvider>().storeList,
          ),
        ),
      ],
    );
  }
}