import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

import 'package:market_check/features/stores/data/models/store_model.dart';

class ShoppingHistoryModalDetails extends StatelessWidget {
  final PurchaseModel currentPurchase;
  final List<StoreModel> stores;
  const ShoppingHistoryModalDetails(
      {super.key, required this.stores, required this.currentPurchase});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: ScreenSize.absoluteHeight * 0.55,
          width: ScreenSize.width * 0.7,
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.1,
              vertical: ScreenSize.absoluteHeight * 0.02),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.text,
              width: 25,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'Codigo Compra: ${currentPurchase.id}',
                style: FontStyles.bodyBold2(AppColors.text),
              ),
              Text(
                'Pin de Pago: ${currentPurchase.pin}',
                style: FontStyles.bodyBold2(AppColors.text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
