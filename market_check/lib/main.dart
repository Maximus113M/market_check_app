import 'package:flutter/material.dart';
import 'package:market_check/features/categories/presentation/providers/categories_provider.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/shopping_lists/presentation/providers/shopping_list_provider.dart';

import 'injection_container.dart';
import 'package:market_check/config/theme/app_theme.dart';
import 'package:market_check/config/router/app_router.dart';
import 'package:market_check/features/products/presentation/providers/products_provider.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/purchases/presentation/providers/shopping_cart_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => sl<MainProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<SignInProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<StoresProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<OffersProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<ProductsProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<CategoriesProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<ShoppingCartProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<ProfileProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => sl<ShoppingListsProvider>(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0, isDarkMode: false).getThemeData(),
    );
  }
}
