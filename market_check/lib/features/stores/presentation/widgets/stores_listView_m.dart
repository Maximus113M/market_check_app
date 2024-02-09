import 'package:flutter/material.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

import 'package:provider/provider.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

class StoresListViewM extends StatelessWidget {
  const StoresListViewM({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<StoreModel> storeList =
        context.read<StoresProvider>().storeList;
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text('Listado de establecimientos cercanos'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                final stores = storeList[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.store,
                        color: Color(0xFFF25B50),
                        size: 50,
                      ),
                      title: Text(stores.name),
                      trailing: const Icon(
                        //Icons.arrow_forward_ios_outlined,
                        Icons.add_box_outlined,
                        size: 30,
                        color: Color(0xFFF25B50),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
