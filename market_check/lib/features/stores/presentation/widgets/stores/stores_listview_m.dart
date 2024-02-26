import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('Listado de establecimientos cercanos',
                  style: TextStyle(fontSize: 16)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: storeList.length,
              itemBuilder: (context, index) {
                final store = storeList[index];
                return GestureDetector(
                  onTap: () {
                    context.read<StoresProvider>().currentStore = store;
                    context.push("/store-view");
                  },
                  child: StoresListTile(storeModel: store),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
