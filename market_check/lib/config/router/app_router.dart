import 'package:market_check/features/screens.dart';

import 'package:go_router/go_router.dart';
import 'package:market_check/features/shopping_lists/presentation/screens/add_products_list_screen.dart';
import 'package:market_check/features/stores/presentation/screens/store/store_info_screen.dart';
import 'package:market_check/features/stores_visited/presentation/screens/stores_visited_screen.dart';

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
      builder: (context, state) => StoreScreen(
        storesProvider: sl(),
      ),
    ),
    GoRoute(
      path: "/products-categories",
      name: ProductsByCategoryScreen.name,
      builder: (context, state) => const ProductsByCategoryScreen(),
    ),
    GoRoute(
      path: "/offers-m",
      name: OfferScreen.name,
      builder: (context, state) => OfferScreen(
        productsProvider: sl(),
      ),
    ),
    GoRoute(
      path: "/store-info",
      name: StoreInfoScreen.name,
      builder: (context, state) => const StoreInfoScreen(),
    ),
    GoRoute(
      path: "/shopping-cart",
      name: ShoppingCartScreen.name,
      builder: (context, state) => const ShoppingCartScreen(),
    ),
    GoRoute(
      path: "/lists",
      name: ShoppingListScreen.name,
      builder: (context, state) => const ShoppingListScreen(),
    ),
    GoRoute(
      path: "/create-lists",
      name: CreateShoppingListScreen.name,
      builder: (context, state) => const CreateShoppingListScreen(),
    ),
    GoRoute(
      path: "/addProducts-lists",
      name: AddProductsListScreen.name,
      builder: (context, state) => AddProductsListScreen(
        shoppingListsProvider: sl(),
      ),
    ),
    GoRoute(
      path: "/shopping-history",
      name: ShoppingHistoryScreen.name,
      builder: (context, state) => const ShoppingHistoryScreen(),
    ),
    GoRoute(
      path: "/stores-visited",
      name: StoresVisitedScreen.name,
      builder: (context, state) => const StoresVisitedScreen(),
    ),
    GoRoute(
      path: "/scanner",
      name: ScannerScreen.name,
      builder: (context, state) => const ScannerScreen(),
    ),
    GoRoute(
      path: "/profile-details",
      builder: (context, state) => const ProfileDetailsScreen(),
    ),
  ],
);
