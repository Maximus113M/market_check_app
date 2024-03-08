import 'package:flutter/material.dart';

import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/pending_purchases/presentation/widgets/pending_purchases_body_screen.dart';

import 'package:provider/provider.dart';

class PendingPurchasesScreen extends StatelessWidget {
  static const String name = "store-items-screen";
  const PendingPurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: PendingPurchasesBodyScreen(
        pendingPurchaseProvider: context.watch(),
      ),
    );
  }
}
