import 'package:flutter/material.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_container_screen.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  static const String name = 'store-view';
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreModel store = context.read<StoresProvider>().currentStore!;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.network('${RemoteUrls.currentImagesUrl}${store.poster!}',
            width: double.infinity,
            height: ScreenSize.absoluteHeight * 0.4,
            fit: BoxFit.cover),
          ),
          const StoreContainerScreen(),
        ],
      ),
    );
  }
}