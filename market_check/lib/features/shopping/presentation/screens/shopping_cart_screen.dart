import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/features/shopping/presentation/widgets/custom_shopping_item.dart';
import 'package:market_check/features/shopping/presentation/providers/shopping_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class ShoppingCartScreen extends StatelessWidget {
  static const String name = 'shopping-cart';
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: context.watch<ShoppingProvider>().isLoading,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          isCartVisible: false,
          title: Text('Carrito de compras',
              style: FontStyles.subtitle0(AppColors.appSecondary)),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appSecondary,
            ),
          ),
        ),
        body: SafeArea(
          child: ShoppingCartBodyScreen(
            shoppingCartProvider: Provider.of<ShoppingProvider>(context),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartBodyScreen extends StatelessWidget {
  final ShoppingProvider shoppingCartProvider;

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
                left: ScreenSize.width * 0.03,
                top: ScreenSize.absoluteHeight * 0.025,
                bottom: ScreenSize.absoluteHeight * 0.020),
            child: Text(
              '${shoppingCartProvider.shoppingItemsCount()} ${shoppingCartProvider.shoppingItemsCount() == 1 ? 'Producto agregado' : 'Productos agregados'}',
              style: FontStyles.bodyBold0(AppColors.lightText),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.disabled, width: 2),
                borderRadius: BorderRadius.circular(20)),
            height: ScreenSize.height * 0.68,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width * 0.02,
                vertical: ScreenSize.absoluteHeight * 0.01,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: shoppingCartProvider.shoppingList.length,
              itemBuilder: (context, index) {
                return FadeIn(
                  child: CustomShoppingItem(
                    item: shoppingCartProvider.shoppingList[index],
                    index: index,
                    shoppingCartProvider:
                        Provider.of<ShoppingProvider>(context),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.03,
              vertical: ScreenSize.absoluteHeight * 0.012,
            ).copyWith(
              bottom: ScreenSize.absoluteHeight * 0.05,
            ),
            child: Row(
              children: [
                Text(
                  'Total: ',
                  style: FontStyles.subtitle1(AppColors.text),
                ),
                Text(
                  '\$${shoppingCartProvider.totalBuy}',
                  style: FontStyles.body1(AppColors.text),
                ),
                const Spacer(),
                CustomFilledButton(
                  fontStyle: FontStyles.bodyBold1(AppColors.appPrimary),
                  text: AuthService.user!.isPurchaseOpen
                      ? 'Compra Pendiente'
                      : 'Finalizar Compra',
                  bgColor: AppColors.appSecondary,
                  color: AppColors.appPrimary,
                  radius: 0.03,
                  action: () => {
                    shoppingCartProvider.endShopping(context),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
