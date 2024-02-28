import 'package:flutter/material.dart';

import 'package:market_check/features/screens.dart';
import 'package:market_check/features/pending_purchases/presentation/screens/pending_purchases_screen.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screenList = [
    const StoresScreenM(),
    const ShoppingListScreen(),
    const PendingPurchasesScreen(),
    const ProfileScreen(),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void navigateToScreen(int index) {
    if (index >= 0 && index < screenList.length) {
      currentIndex = index;
      notifyListeners();
    }
  }
}
