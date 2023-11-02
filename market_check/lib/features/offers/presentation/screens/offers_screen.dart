import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

class OffersScreen extends StatelessWidget {
  static const String name = "offers-screen";
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: AppColors.gradientColors)),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
          title: const Text("Ofertas"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: const _OffersView(),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class _OffersView extends StatelessWidget {
  const _OffersView();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height * 0.85,
        width: screenSize.width,
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        margin: EdgeInsets.fromLTRB(
            screenSize.width * 0.025, 13, screenSize.width * 0.025, 0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: SingleChildScrollView());
  }
}
