import 'package:flutter/material.dart';

import 'package:market_check/config/theme/app_theme.dart';
import 'package:market_check/config/router/app_router.dart';
import 'package:market_check/features/login/presentation/providers/login_form_provider.dart';
import 'package:market_check/features/offers/data/datasources/offer_datasource.dart';
import 'package:market_check/features/offers/data/repositories/offer_repository_impl.dart';
import 'package:market_check/features/offers/domain/use_cases/get_offers_use_case.dart';
import 'package:market_check/features/offers/presentation/providers/offer_provider.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';
import 'package:market_check/features/stores/data/datasources/store_datasource.dart';
import 'package:market_check/features/stores/data/repositories/store_repositoryimpl.dart';
import 'package:market_check/features/stores/domain/use_cases/get_stores_use_case.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
//import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await di.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => OfferProvider(
              GetOffersUseCase(OfferRepositoryImpl(OffersDBDatasource())))),
      ChangeNotifierProvider(
          create: (context) => StoresProvider(
              GetStoresUseCase(StoreRepositoryImpl(StoreDBDatasource())))),
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
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
