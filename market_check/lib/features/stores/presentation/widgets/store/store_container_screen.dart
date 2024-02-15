import 'package:flutter/material.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_menu_screen.dart';
import 'package:provider/provider.dart';

class StoreContainerScreen extends StatelessWidget {
  const StoreContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreModel store = context.read<StoresProvider>().currentStore!;
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.3),
      padding: EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.03, horizontal: ScreenSize.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
      ),
      child: Column(
        children: [
          Text(store.name, style: const TextStyle(fontSize: 25)),
          const SizedBox(height: 25),
          const Text(
              'Nostrud pariatur incididunt aute est incididunt magna commodo dolor quis consequat quis et pariatur labore.Commodo labore ad est ut magna ad aliquip culpa laboris Lorem enim veniam non laboris.Non aliqua culpa proident tempor ad ea.'),
          const SizedBox(height: 35),
          const StoreMenuScreen()
        ],
      ),
    );
  }
}
