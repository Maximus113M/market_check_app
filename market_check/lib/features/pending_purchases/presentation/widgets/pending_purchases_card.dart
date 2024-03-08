import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/shopping_history/data/models/purchase_model.dart';
import 'package:market_check/features/shopping_history/data/models/registered_purchase_item.dart';

class PendingPurchasesCard extends StatelessWidget {
  final PurchaseModel purchase;
  final StoreModel store;
  final List<RegisteredPurchaseItemModel> products;

  const PendingPurchasesCard(
      {super.key,
      required this.purchase,
      required this.store,
      required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              vertical: ScreenSize.absoluteHeight * 0.01,
              horizontal: ScreenSize.width * 0.02)
          .copyWith(left: ScreenSize.width * 0.03),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.unfocused.withOpacity(0.8),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.width * 0.04),
        ),
        boxShadow: AppShadows.profileShadow,
        color: AppColors.white.withOpacity(0.95),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.02),
        child: SizedBox(
          width: ScreenSize.width * 0.8,
          child: Column(
            children: [
              Text(
                store.name,
                maxLines: 2,
                style: FontStyles.subtitle1(AppColors.appSecondary),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Nit. ${store.nit}',
                maxLines: 2,
                style: FontStyles.bodyBold4(AppColors.text),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                store.email,
                maxLines: 2,
                style: FontStyles.body4(AppColors.text),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                store.locations,
                maxLines: 2,
                style: FontStyles.body4(AppColors.text),
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.02,
                ).copyWith(
                  top: ScreenSize.absoluteHeight * 0.01,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppFuntions.mothNameMap[purchase.date.month]!.substring(0, 3)}.${purchase.date.day} - ${purchase.date.year} ${purchase.hour}',
                        style: FontStyles.body4(AppColors.text),
                      ),
                      Text(
                        '${AuthService.user!.name} - ${AuthService.user!.document}',
                        style: FontStyles.body4(AppColors.text),
                      ),
                      Text(
                        'Pendiente de pago',
                        style: FontStyles.body4(AppColors.errorText),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: ScreenSize.absoluteHeight * 0.012,
                  horizontal: ScreenSize.width * 0.01,
                ),
                constraints: BoxConstraints(
                  maxHeight: ScreenSize.absoluteHeight * 0.5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.disabled),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.015,
                    horizontal: ScreenSize.width * 0.05,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: ScreenSize.width * 0.4,
                          child: Text(
                            '${products[index].quanty}x ${products[index].name}',
                            style: FontStyles.body3(AppColors.text),
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
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width * 0.025,
                    vertical: ScreenSize.absoluteHeight * 0.006),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin_rounded,
                      size: ScreenSize.absoluteHeight * 0.035,
                    ),
                    Text(
                      'Pin: ${purchase.pin}',
                      style: FontStyles.bodyBold2(AppColors.text),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.monetization_on,
                      size: ScreenSize.absoluteHeight * 0.029,
                    ),
                    Text(
                      'Total: ${purchase.total}',
                      style: FontStyles.bodyBold2(AppColors.text),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenSize.absoluteHeight * 0.012,
              )
            ],
          ),
        ),
      ),
    );
  }
}
