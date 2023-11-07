import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_item.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';

class StoresBody extends StatelessWidget {
  const StoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StoreEntity> storeList =
        context.read<StoresProvider>().storeList;
    return Container(
      height: ScreenSize.height(context) * 0.85,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      margin: EdgeInsets.fromLTRB(ScreenSize.width(context) * 0.02, 10,
          ScreenSize.width(context) * 0.02, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        itemCount: storeList.length,
        itemBuilder: (context, index) {
          return StoreItem(
            store: storeList[index],
          );
        },
      ),
    );
  }
}
