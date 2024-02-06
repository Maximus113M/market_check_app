import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'package:market_check/config/theme/app_theme.dart';
import 'package:market_check/config/router/app_router.dart';
import 'package:market_check/features/offers/presentation/providers/offer_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => SignInProvider(verifyLogInUseCase: sl())),
      ChangeNotifierProvider(
          create: (context) => StoresProvider(getStoresUseCase: sl())),
      ChangeNotifierProvider(
          create: (context) => OffersProvider(getOffersUseCase: sl())),
      ChangeNotifierProvider(
        create: (context) => ShoppingCartProvider(),
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
