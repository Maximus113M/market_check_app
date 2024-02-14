import 'package:flutter/material.dart';
import 'package:market_check/features/screens.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_screen_body.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> screenList = [
   
    const StoresScreenBody(),
    const OfferScreeenM(),
    const ShoppingListScreen(),
    const ProfileScreen(),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
