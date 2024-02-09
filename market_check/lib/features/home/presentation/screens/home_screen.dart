import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/home/presentation/widgets/custom_badge_icon.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/offers/presentation/widgets/offers_horizontal_listview/offers_horizontal_listview.dart';

import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_slideshow/stores_slideshow.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  final shoppingCartProvider = ShoppingCartProvider();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Esto genera un Key que se utilizara para hacer referencia al home en la ruta
    //del menu lateral
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        body: const _HomeBody(),
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        bottomNavigationBar:
            const GoogleNavBar() //CurvedBottomNavigation() //CustomBottomNavigation(),
        );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  late OffersProvider offersProvider;
  late StoresProvider storesProvider;
  bool isScreenLoaded = false;
  @override
  void didChangeDependencies() async {
    if (isScreenLoaded) return;
    isScreenLoaded = true;
    storesProvider = Provider.of<StoresProvider>(context);
    offersProvider = Provider.of<OffersProvider>(context);

    await offersProvider.loadOffers(notify: false);
    await storesProvider.loadStores(notify: false);
    if (mounted) setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenSize.absoluteHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_sharp,
                    size: ScreenSize.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      AppAssets.logoHorizontal,
                      width: ScreenSize.width * 0.62,
                    ),
                  ),
                  CustomBadge(
                    icon: Icons.shopify,
                    iconSize: ScreenSize.width * 0.1,
                    counter: context
                        .watch<ShoppingCartProvider>()
                        .shoppingItemsCount(),
                    color: AppColors.blueButton,
                  ),
                  const SizedBox(width: 2),
                  CustomBadge(
                      route: '/shopping-cart',
                      icon: Icons.shopping_cart_rounded,
                      iconSize: ScreenSize.width * 0.1,
                      color: AppColors.blueButton,
                      counter: context
                          .watch<ShoppingCartProvider>()
                          .shoppingItemsCount()),
                  const SizedBox(width: 8)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(
                "Supermercados",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            StoresSlideShow(stores: storesProvider.storeList),
            const SizedBox(height: 5),
          OffersHorizontalListView(
              title: "Ofertas Populares",
              subtitle: "6 Ofertas",
              offers: offersProvider.offerList,
            ),
            OffersHorizontalListView(
              title: "Ofertas Noviembre",
              subtitle: "${offersProvider.offerList.length} Ofertas",
              offers: offersProvider.offerList,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
