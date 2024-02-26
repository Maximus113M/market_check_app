import 'package:market_check/features/screens.dart';

import 'package:go_router/go_router.dart';
import 'package:market_check/features/shopping_lists/presentation/screens/add_products_list_screen.dart';
import 'package:market_check/injection_container.dart';

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
      builder: (context, state) => StoreScreen(storesProvider: sl()),
    ),
    /*GoRoute(
      path: "/products-view",
      name: ProductsScreen.name,
      builder: (context, state) => ProductsScreen(productsList: sl()),
    ),*/
    GoRoute(
      path: "/products-categories",
      name: ProductsByCategoryScreen.name,
      builder: (context, state) => const ProductsByCategoryScreen(),
    ),
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
      builder: (context, state) => const AddProductsListScreen(),
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
