import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/home/presentation/widgets/custom_badge_icon.dart';
import 'package:market_check/features/offers/presentation/providers/offer_provider.dart';
import 'package:market_check/features/shopping_cart/presentation/providers/shopping_cart_provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_slideshow/stores_slideshow.dart';
import 'package:market_check/features/offers/presentation/widgets/offers_horizontal_listview/offers_horizontal_listview.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  final shoppingCartProvider = ShoppingCartProvider();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Esto genera un Key que se utilizara para hacer referencia al home en la ruta
    //del menu lateral
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: AppColors.gradientColors)),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(18),
                ),
              ),
              actions: [
                CustomBadge(
                  icon: Icons.shopify,
                  iconSize: 35,
                  counter: shoppingCartProvider.shoppingItemsCount(),
                  color: AppColors.blueButton,
                ),
                const SizedBox(width: 2),
                CustomBadge(
                    route: '/shopping-cart',
                    icon: Icons.shopping_cart_rounded,
                    iconSize: 35,
                    color: AppColors.blueButton,
                    counter: shoppingCartProvider.shoppingItemsCount()),
                const SizedBox(width: 8)
              ],
              title: Text(
                'Market Check',
                style:
                    FontStyles.heading4( Colors.black.withOpacity(0.7)),
              )),
          body: const _HomeBody(),
          drawer: SideMenu(scaffoldKey: scaffoldKey),
          bottomNavigationBar:
              const GoogleNavBar() //CurvedBottomNavigation() //CustomBottomNavigation(),
          ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  late OfferProvider offersProvider;
  late StoresProvider storesProvider;
  bool isScreenLoaded = false;
  @override
  void didChangeDependencies() async {
    if (isScreenLoaded) return;
    isScreenLoaded = true;
    storesProvider = Provider.of<StoresProvider>(context);
    offersProvider = Provider.of<OfferProvider>(context);

    await offersProvider.loadOffers(notify: false);
    await storesProvider.loadStores(notify: false);
    if (mounted) setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * 0.85,
      width: ScreenSize.width,
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      margin: EdgeInsets.fromLTRB(
        ScreenSize.width * 0.025,
        13,
        ScreenSize.width * 0.025,
        0,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      child: (storesProvider.storeList.isEmpty)
          ? FadeIn(
              child: Image.asset(
                AppAssets.loadingImage,
                fit: BoxFit.contain,
                height: ScreenSize.height * 0.5,
                width: ScreenSize.width,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
                    child: Text(
                      "Supermercados",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  StoresSlideShow(stores: storesProvider.storeList),
                  const SizedBox(height: 5),
                  OffersHorizontalListView(
                    title: "Ofertas Populares",
                    subtitle: "6 Ofertas",
                    offers: offersProvider.offerList.sublist(0, 6),
                  ),
                  OffersHorizontalListView(
                    title: "Ofertas Noviembre",
                    subtitle: "${offersProvider.offerList.length} Ofertas",
                    offers: offersProvider.offerList.sublist(6, 19),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
    );
  }
}
