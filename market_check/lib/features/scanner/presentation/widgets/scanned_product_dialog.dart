import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/buttons/add_remove_button.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/products/data/models/product_model.dart';

class ScannedProductDialog extends StatelessWidget {
  final ProductModel product;
  final Function() mainAction;
  final Function() secondaryAction;
  final Function() addAction;
  final Function() removeAction;
  final int productCount;
  final int totalPrice;

  const ScannedProductDialog(
      {super.key,
      required this.product,
      required this.mainAction,
      required this.secondaryAction,
      required this.productCount,
      required this.totalPrice,
      required this.addAction,
      required this.removeAction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenSize.width * 0.1),
      ),
      surfaceTintColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.07),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.loyalty,
                size: ScreenSize.width * 0.07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.02,
                ),
                child: SizedBox(
                  width: ScreenSize.width * 0.6,
                  child: Text(
                    product.name,
                    style: FontStyles.subtitle0(AppColors.appSecondary),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.width * 0.09),
            child: Text(
              product.description ?? '',
              style: FontStyles.body3(AppColors.text),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width * 0.1,
          vertical: ScreenSize.absoluteHeight * 0.01),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /*Text(
            product.description ?? '',
            style: FontStyles.body3(AppColors.text),
          ),*/
          Text(
            '¿Deseas añadir este producto al carrito de compras?',
            style: FontStyles.body3(AppColors.text),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$$totalPrice',
                  style: FontStyles.bodyBold2(AppColors.text),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.absoluteHeight * 0.015)
                      .copyWith(
                    left: ScreenSize.width * 0.03,
                  ),
                  child: AddRemoveButton(
                    count: productCount,
                    addAction: () => addAction(),
                    removeAction: () => removeAction(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomFilledButton(
          radius: 0.03,
          bgColor: AppColors.appSecondary.withOpacity(0.9),
          color: AppColors.appPrimary,
          text: ' Añadir ',
          action: () => mainAction(),
        ),
        CustomFilledButton(
          radius: 0.03,
          bgColor: AppColors.appSecondary.withOpacity(0.9),
          color: AppColors.appPrimary,
          text: 'Cancelar',
          action: () => secondaryAction(),
        ),
      ],
    );
  }
}
