import 'package:flutter/material.dart';
import 'package:market_check/features/profile/data/models/profile_cards_model.dart';

class ProfileProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<ProfileCardsModel> menuCards = ProfileCardsModel.profileCardsMenu;

  void setIndex(int index) {
    selectedIndex = index;
  }
}
