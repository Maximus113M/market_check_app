import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';


class ShoppingListScreen extends StatelessWidget {
  static const String name = "shopping-list-screen";
  const ShoppingListScreen({super.key});
  
  get shoppingLists => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context, isCartVisible: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/lista.png',
              width: ScreenSize.width * 0.4,
            ),
            const Center(
              child: Text(
                "No tienes listas guardadas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.absoluteHeight * 0.03,
                  vertical: ScreenSize.width * 0.03),
              child: const Text(
                  '¡Organiza tus compras de forma rápida y sencilla! Crea tu lista de productos aquí y mantén un control eficaz de tus compras.'),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                context.push('/create-lists');
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.appPrimary,
              ),
              label: const Text(
                'Crea tu lista',
                style: TextStyle(color: AppColors.appPrimary),
              ),
            ),
          ],
        ),
      );
    }     
  }
  

