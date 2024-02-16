import 'package:market_check/features/main_screen/presentation/screens/main_screen.dart';
import 'package:market_check/features/products/presentation/screens/productos_screen.dart';
import 'package:market_check/features/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/features/stores/presentation/screens/store/store_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    /* ShellRoute(
        builder: (context, state, child) => const LoginScreen(),
        routes: [
          GoRoute(
              path: "/home",
              name: HomeScreen.name,
              builder: (context, state) => const HomeScreen()),
        ]),*/
    /*GoRoute(
        path: "/login",
        name: LogInScreen.name,
        builder: (context, state) => const LogInScreen()),*/
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
    /*GoRoute(
      path: "/home",
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),*/
    GoRoute(
      path: "/shopping-cart",
      name: ShoppingCart.name,
      builder: (context, state) => const ShoppingCart(),
    ),
    GoRoute(
        path: "/stores-m",
        name: StoresScreenM.name,
        builder: (context, state) => const StoresScreenM(
            /* storesProvider: sl(),*/
            )),
    GoRoute(
      path: "/store-view",
      name: StoreScreen.name,
      builder: (context, state) => const StoreScreen(),
    ),
    GoRoute(
      path: "/products-view",
      name: ProductsScreen.name,
      builder: (context, state) => const ProductsScreen(),
    ),
     GoRoute(
      path: "/offers-m",
      name: OfferScreeenM.name,
      builder: (context, state) => const OfferScreeenM(),
    ),
    GoRoute(
      path: "/offers",
      name: OffersScreen.name,
      builder: (context, state) => const OffersScreen(),
    ),
    GoRoute(
      path: "/offer-view",
      name: OfferView.name,
      builder: (context, state) => const OfferView(),
    ),
    GoRoute(
      path: "/store-categories",
      name: StoreCategoriesScreen.name,
      builder: (context, state) => const StoreCategoriesScreen(),
    ),
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
      path: "/",
      builder: (context, state) => const HomeScreen1(),
    ),
  ],
);
