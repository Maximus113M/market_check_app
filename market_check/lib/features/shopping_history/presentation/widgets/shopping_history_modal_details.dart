import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/purchases/data/models/registered_purchase_item.dart';

import 'package:go_router/go_router.dart';

class ShoppingHistoryModalDetails extends StatelessWidget {
  final PurchaseModel currentPurchase;
  final List<StoreModel> stores;
  final List<RegisteredPurchaseItemModel> products;
  const ShoppingHistoryModalDetails({
    super.key,
    required this.stores,
    required this.currentPurchase,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Center(
          child: Container(
            width: ScreenSize.width * 0.85,
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.1,
                vertical: ScreenSize.absoluteHeight * 0.025),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.text,
                ),
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    stores
                        .where((store) =>
                            store.id == currentPurchase.establecimientoId)
                        .first
                        .name,
                    maxLines: 3,
                    style: FontStyles.subtitle0(AppColors.appSecondary),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.absoluteHeight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.height * 0.005),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppFuntions.mothNameMap[currentPurchase.date.month]!.substring(0, 3)}-${currentPurchase.date.day}-${currentPurchase.date.year} ${currentPurchase.hour}',
                        style: FontStyles.bodyBold2(AppColors.text),
                      ),
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
                const Divider(
                  color: AppColors.lightText2,
                ),
                SizedBox(
                  height: products.length > 6
                      ? ScreenSize.absoluteHeight * 0.5
                      : ScreenSize.absoluteHeight * 0.2,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width * 0.025),
                    itemCount: products.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenSize.width * 0.35,
                            child: Text(
                              '${products[index].quanty}x ${products[index].name}',
                              style: FontStyles.body2(AppColors.text),
                            ),
                          ),
                          SizedBox(
                            width: ScreenSize.width * 0.24,
                            child: Text(
                              '${products[index].price}',
                              style: FontStyles.body3(AppColors.text),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: AppColors.lightText2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.absoluteHeight * 0.015,
                      vertical: ScreenSize.absoluteHeight * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Productos: ${products.length}',
                        style: FontStyles.bodyBold1(AppColors.text),
                      ),
                      Text(
                        'Total: ${currentPurchase.total}',
                        style: FontStyles.bodyBold1(AppColors.appSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: ScreenSize.width * 0.08,
          top: products.length > 6
              ? ScreenSize.absoluteHeight * 0.105
              : ScreenSize.absoluteHeight * 0.258,
          child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.cancel,
              )),
        ),
      ],
    );
  }
}
