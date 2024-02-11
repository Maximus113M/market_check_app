import 'package:flutter/material.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_listtitle.dart';

import 'package:provider/provider.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

class StoresListviewM extends StatelessWidget {

  const StoresListviewM({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<StoreModel> storeList =
        context.watch<StoresProvider>().storeList;
    
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('Listado de establecimientos cercanos'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                final store = storeList[index];
                return StoresListTile(storeModel: store);
              },
            ),
          ),
        ],
      ),
    );
  }
}
