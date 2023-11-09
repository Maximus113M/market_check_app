import 'package:go_router/go_router.dart';
import 'package:market_check/features/scanner/presentation/screens/scanner_screen.dart';
import 'package:market_check/features/screens.dart';
import 'package:market_check/features/stores/presentation/screens/store_view.dart';

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
    GoRoute(
        path: "/",
        name: LogInScreen.name,
        builder: (context, state) => const LogInScreen()),
    GoRoute(
        path: "/login-form",
        name: LogInFormScreen.name,
        builder: (context, state) => const LogInFormScreen()),
    GoRoute(
        path: "/home",
        name: HomeScreen.name,
        builder: (context, state) => HomeScreen()),
    GoRoute(
        path: "/shopping-cart",
        name: ShoppingCart.name,
        builder: (context, state) => const ShoppingCart()),
    GoRoute(
        path: "/stores",
        name: StoresScreen.name,
        builder: (context, state) => const StoresScreen()),
    GoRoute(
        path: "/store-view",
        name: StoreView.name,
        builder: (context, state) => const StoreView()),
    GoRoute(
        path: "/offers",
        name: OffersScreen.name,
        builder: (context, state) => const OffersScreen()),
    GoRoute(
        path: "/offer-view",
        name: OfferView.name,
        builder: (context, state) => const OfferView()),
    GoRoute(
        path: "/store-categories",
        name: StoreCategoriesScreen.name,
        builder: (context, state) => const StoreCategoriesScreen()),
    GoRoute(
        path: "/lists",
        name: ShoppingListScreen.name,
        builder: (context, state) => const ShoppingListScreen()),
    GoRoute(
        path: "/shopping-history",
        name: ShoppingHistoryScreen.name,
        builder: (context, state) => const ShoppingHistoryScreen()),
    GoRoute(
        path: "/profile",
        name: ProfileScreen.name,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: "/settings",
        name: SettingsScreen.name,
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
      path: "/scanner",
      builder: (context, state) => const ScannerScreen(),
    ),
  ],
);
