import 'package:flutter/material.dart';
import 'package:market_check/features/screens.dart';

class MainProvider extends ChangeNotifier{
  int currentIndex = 0;
  List<Widget> screenList = [
    const OfferScreeenM(),
    const StoresScreenM(),
    Container(child: const Text('Listas')),
    Container(child: const Text('Perfil')),
  ];

}