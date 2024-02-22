import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';

class ShoppingHistoryItem extends StatelessWidget {
  final PurchaseModel purchase;
  final List<StoreModel> stores;
  const ShoppingHistoryItem(
      {super.key, required this.purchase, required this.stores});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              vertical: ScreenSize.absoluteHeight * 0.01,
              horizontal: ScreenSize.width * 0.02)
          .copyWith(left: ScreenSize.width * 0.03),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.disabled,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.width * 0.04),
        ),
        boxShadow: AppShadows.profileShadow,
        color: AppColors.white.withOpacity(0.95),
      ),
      child: Row(
        children: [
          SizedBox(
            height: ScreenSize.absoluteHeight * 0.065,
            width: ScreenSize.width * 0.16,
            child: Image.asset(AppAssets.invoiceIcon),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.02),
            child: SizedBox(
              width: ScreenSize.width * 0.5,
              child: Column(
                children: [
                  Text(
                    stores
                        .where(
                            (store) => store.id == purchase.establecimientoId)
                        .first
                        .name,
                    maxLines: 2,
                    style: FontStyles.bodyBold0(AppColors.appSecondary),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${AppFuntions.mothNameMap[purchase.date.month]!.substring(0, 3)}-${purchase.date.day}-${purchase.date.year} ${purchase.hour}',
                    style: FontStyles.bodyBold2(AppColors.text),
                  ),
                  Text(
                    'Total: ${purchase.total}',
                    style: FontStyles.bodyBold2(AppColors.text),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: ScreenSize.width * 0.01,
          ),
          const Icon(
            Icons.info,
          ),
        ],
      ),
    );
  }
}
