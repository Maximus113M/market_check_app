import 'package:flutter/material.dart';
import 'package:market_check/features/pending_purchases/presentation/screens/pending_purchases_screen.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_screen_body.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screenList = [
    const Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: StoresScreenBody(),
    ),
    const OfferScreeenM(),
    const PendingPurchasesScreen(),
    const ProfileScreen(),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
