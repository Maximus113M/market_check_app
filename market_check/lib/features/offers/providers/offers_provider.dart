import 'package:flutter/material.dart';

class OfferProvider extends ChangeNotifier{
  
  bool click = false;

  void statedClick(){
    
      click = !click;
    notifyListeners();
  }

}