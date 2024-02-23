import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/purchases/presentation/widgets/custom_shopping_item.dart';
import 'package:market_check/features/purchases/presentation/providers/shopping_cart_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class ShoppingCartScreen extends StatelessWidget {
  static const String name = 'shopping-cart';
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
        title: Text(
          'Carrito de Compras',
          style: FontStyles.heading11(AppColors.appSecondary),
        ),
        toolbarHeight: 40,
      ),
      body: ShoppingCartBodyScreen(
        shoppingCartProvider: Provider.of<ShoppingCartProvider>(context),
      ),
    );
  }
}

class ShoppingCartBodyScreen extends StatelessWidget {
  final ShoppingCartProvider shoppingCartProvider;

  const ShoppingCartBodyScreen({super.key, required this.shoppingCartProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: ScreenSize.width * 0.13,
                bottom: ScreenSize.absoluteHeight * 0.02),
            child: Text(
              '${shoppingCartProvider.shoppingItemsCount()} Productos agregados',
              style: FontStyles.bodyBold1(AppColors.lightText),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.disabled, width: 2),
                borderRadius: BorderRadius.circular(20)),
            height: ScreenSize.height * 0.65,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              physics: const BouncingScrollPhysics(),
              itemCount: shoppingCartProvider.shoppingList.length,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: CustomShoppingItem(
                    item: shoppingCartProvider.shoppingList[index],
                    index: index,
                    shoppingCartProvider:
                        Provider.of<ShoppingCartProvider>(context),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width * 0.03,
                    vertical: ScreenSize.absoluteHeight * 0.012)
                .copyWith(bottom: ScreenSize.absoluteHeight * 0.05),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: FontStyles.subtitle1(AppColors.appSecondary),
                ),
                const Spacer(),
                const Icon(Icons.monetization_on_sharp),
                Text(
                  shoppingCartProvider.totalBuy.toString(),
                  style: FontStyles.bodyBold1(AppColors.text),
                )
              ],
            ),
          ),
          CustomButton(
            text: 'FINALIZAR COMPRA',
            verticalSize: 0.06,
            bgColor: AppColors.appSecondary,
            color: AppColors.white,
            horizontalMargin: 0.07,
            radius: 0.04,
            action: () => {
              shoppingCartProvider.showEndShoppingDialog(context),
              print('${shoppingCartProvider.pendingList.length}  ???')
            },
          ),
        ],
      ),
    );
  }
}
