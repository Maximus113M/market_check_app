import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/features/home/presentation/widgets/custom_badge_icon.dart';
import 'package:market_check/features/shopping_cart/presentation/widgets/custom_shopping_item.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class ShoppingCart extends StatelessWidget {
  static const String name = 'shopping-cart';
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        actions: [
          CustomBadge(
              icon: Icons.settings, iconSize: 30, height: 30, counter: 0),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: const ShoppingCartBody(),
    );
  }
}

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carrito de Compras',
                style: FontStyles.heading2(context, AppColors.blueButton3),
              ),
              Text(
                '    ${shoppingCartProvider.shoppingItemsCount()} Productos agregados',
                style: FontStyles.bodyBold1(context, AppColors.lightText),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              SizedBox(
                height: ScreenSize.height * 0.6,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  physics: const BouncingScrollPhysics(),
                  itemCount: shoppingCartProvider.shoppingList.length,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                      child: CustomShoppingItem(
                        item: shoppingCartProvider.shoppingList[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: FontStyles.subtitle1(context, AppColors.text),
                    ),
                    const Spacer(),
                    const Icon(Icons.monetization_on_sharp),
                    Text(
                      shoppingCartProvider.totalBuy.toString(),
                      style: FontStyles.bodyBold1(context, AppColors.text),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledCustomButton(
                    text: 'Finalizar Compra',
                    horizontalSize: 25,
                    verticalSize: 15,
                    color: AppColors.whiteBg,
                    bgColor: AppColors.blueButton1,
                    route: '/home',
                    action: () => {
                      shoppingCartProvider.showEndShoppingDialog(context),
                      //setState(() {}),
                      print('${shoppingCartProvider.pendingList.length}  ???')
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
