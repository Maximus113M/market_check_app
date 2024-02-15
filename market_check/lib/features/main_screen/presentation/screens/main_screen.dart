import 'package:flutter/material.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/main_screen/presentation/screens/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<MainProvider>().screenList[
        context.watch<MainProvider>().currentIndex],
        bottomNavigationBar: const BottomMenu(),
    );
  }
}