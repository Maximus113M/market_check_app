import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/profile_cards/data/models/purchase_model.dart';
import 'package:market_check/features/profile_cards/data/models/registered_purchase_item.dart';

import 'package:animate_do/animate_do.dart';

class PurchasesCard extends StatelessWidget {
  final PurchaseModel purchase;
  final StoreModel store;
  final List<RegisteredPurchaseItemModel> products;

  const PurchasesCard(
      {super.key,
      required this.purchase,
      required this.store,
      required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width * 0.89,
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.absoluteHeight * 0.01,
        horizontal: ScreenSize.width * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.unfocused.withOpacity(0.9),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenSize.width * 0.04),
        ),
        boxShadow: AppShadows.profileShadow,
        color: AppColors.white.withOpacity(0.95),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            storeInfoText(
              text: store.name,
              style: FontStyles.subtitle1(AppColors.appSecondary),
              maxLines: 2,
            ),
            storeInfoText(
              text: 'Nit. ${store.nit}',
              style: FontStyles.bodyBold4(AppColors.text),
            ),
            storeInfoText(text: store.email),
            storeInfoText(text: store.locations, maxLines: 2),
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
                    storeInfoText(
                      align: TextAlign.start,
                      text:
                          '${AppFunctions.mothNameMap[purchase.date.month]!.substring(0, 3)}.${purchase.date.day} - ${purchase.date.year} ${purchase.hour}',
                    ),
                    storeInfoText(
                      align: TextAlign.start,
                      text:
                          '${AuthService.user!.name} - ${AuthService.user!.document}',
                    ),
                    Text(
                      purchase.state == 0
                          ? 'Pendiente de pago'
                          : 'Compra Finalizada',
                      style: FontStyles.bodyBold4(
                        purchase.state == 0
                            ? AppColors.errorText
                            : AppColors.successText,
                      ),
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
                  horizontal: ScreenSize.width * 0.04,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FadeIn(
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenSize.width * 0.45,
                          child: Text(
                            '${products[index].quanty}x  ${products[index].name}',
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
                    ),
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
              height: ScreenSize.absoluteHeight * 0.002,
            )
          ],
        ),
      ),
    );
  }

  SizedBox storeInfoText(
      {required String text,
      int maxLines = 1,
      TextStyle? style,
      TextAlign align = TextAlign.center}) {
    return SizedBox(
      width: ScreenSize.width * 0.78,
      child: Text(
        text,
        maxLines: maxLines,
        style: style ?? FontStyles.body4(AppColors.text),
        overflow: TextOverflow.ellipsis,
        textAlign: align,
      ),
    );
  }
}
