import 'package:dartz/dartz.dart';
import 'package:market_check/features/screens.dart';
import 'package:market_check/injection_container.dart';
import 'package:market_check/features/main_screen/presentation/screens/main_screen.dart';
import 'package:market_check/features/products/presentation/screens/productos_screen.dart';
import 'package:market_check/features/stores/presentation/screens/store/store_screen.dart';
import 'package:market_check/features/profile/presentation/screens/profile_details_screen.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => SplashScreen(
        signInProvider: sl(),
      ),
    ),
    GoRoute(
      path: "/login-form",
      name: LogInFormScreen.name,
      builder: (context, state) => const LogInFormScreen(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/stores-m",
      name: StoresScreenM.name,
      builder: (context, state) => const StoresScreenM(
          /* storesProvider: sl(),*/
          ),
    ),
    GoRoute(
      path: "/store-view",
      name: StoreScreen.name,
      builder: (context, state) => const StoreScreen(),
    ),
    GoRoute(
      path: "/products-view",
      name: ProductsScreen.name,
      builder: (context, state) => const ProductsScreen(
      ),
    ),
    /*GoRoute(
      path: "/products-view/:id",
      name: ProductsScreen.name,
      builder: (context, state) => ProductsScreen(
        id:state.pathParameters['id'],
      ),
    ),*/
     GoRoute(
      path: "/offers-m",
      name: OfferScreeenM.name,
      builder: (context, state) => const OfferScreeenM(),
    ),
    GoRoute(
      path: "/shopping-cart",
      name: ShoppingCart.name,
      builder: (context, state) => const ShoppingCart(),
    ),
    /*GoRoute(
      path: "/store-categories",
      name: StoreCategoriesScreen.name,
      builder: (context, state) => const StoreCategoriesScreen(),
    ),*/
    GoRoute(
      path: "/lists",
      name: ShoppingListScreen.name,
      builder: (context, state) => const ShoppingListScreen(),
    ),
    GoRoute(
      path: "/shopping-history",
      name: ShoppingHistoryScreen.name,
      builder: (context, state) => const ShoppingHistoryScreen(),
    ),
    GoRoute(
      path: "/settings",
      name: SettingsScreen.name,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: "/scanner",
      builder: (context, state) => const ScannerScreen(),
    ),
    GoRoute(
      path: "/profile-details",
      builder: (context, state) => const ProfileDetailsScreen(),
    ),
  ],
);
