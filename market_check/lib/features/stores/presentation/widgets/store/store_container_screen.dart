import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_menu_screen.dart';

import 'package:provider/provider.dart';

class StoreContainerScreen extends StatelessWidget {
  const StoreContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreModel store = context.watch<StoresProvider>().currentStore!;
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.3),
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.absoluteHeight * 0.03,
          horizontal: ScreenSize.width * 0.05),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ScreenSize.width * 0.075),
          topLeft: Radius.circular(ScreenSize.width * 0.075),
        ),
      ),
      child: Column(
        children: [
          Text(
            store.name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 35),
          const StoreMenuScreen()
        ],
      ),
    );
  }
}
