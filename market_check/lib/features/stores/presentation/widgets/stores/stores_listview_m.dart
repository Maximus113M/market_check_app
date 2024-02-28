import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_listtitle.dart';
import 'package:provider/provider.dart';

class StoresListviewM extends StatelessWidget {
  final List<StoreModel> storeList;
  const StoresListviewM({super.key, required this.storeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          /*Padding(
            padding: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.02),
            child: Text(
              'Establecimientos',
              style: FontStyles.subtitle1(AppColors.lightText),
            ),
          ),*/
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.04,
                  vertical: ScreenSize.absoluteHeight * 0.02),
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<StoresProvider>().currentStore =
                        storeList[index];
                    context.push("/store-view");
                  },
                  child: StoresItemTile(storeModel: storeList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
