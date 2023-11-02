import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/presentation/providers/stores/stores_provider.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_slideshow/stores_slideshow.dart';
import 'package:market_check/features/offers/presentation/widgets/offers_horizontal_listview/offers_horizontal_listview.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";

  const HomeScreen({super.key});

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
                IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      context.push('/shopping-cart');
                    }),
                const SizedBox(width: 10)
              ],
              title: const Text('Market Check')),
          body: const _HomeView(),
          drawer: const SideMenu(),
          bottomNavigationBar:
              const GoogleNavBar() //CurvedBottomNavigation() //CustomBottomNavigation(),
          ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(getStoresProvider.notifier).loadStores();
    ref.read(getOffersProvider.notifier).loadOffers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getStores = ref.watch(getStoresProvider);
    final getOffers = ref.watch(getOffersProvider);

    final screenSize = MediaQuery.of(context).size;

    final DateTime date = DateTime.now();

    return Container(
      height: screenSize.height * 0.85,
      width: screenSize.width,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      margin: EdgeInsets.fromLTRB(
        screenSize.width * 0.025,
        13,
        screenSize.width * 0.025,
        0,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
              child: Text(
                "Supermercados",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            StoresSlideShow(stores: getStores),
            const SizedBox(height: 5),
            OffersHorizontalListView(
              title: "Ofertas Septiembre",
              subtitle: "${getOffers.length} Ofertas",
              offers: getOffers,
              loadOffers: () => ref.read(getOffersProvider.notifier).loadOffers,
            ),
            OffersHorizontalListView(
                title: "Promociones ${getOffers.length}",
                subtitle: "${date.weekday} - ${date.month.toString()}",
                offers: getOffers,
                loadOffers: () =>
                    ref.read(getOffersProvider.notifier).loadOffers),
            OffersHorizontalListView(
                title: "Ofertas Septiembre",
                subtitle: "${getOffers.length} Ofertas",
                offers: getOffers,
                loadOffers: () =>
                    ref.read(getOffersProvider.notifier).loadOffers),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
