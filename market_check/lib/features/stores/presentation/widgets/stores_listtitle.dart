import 'package:flutter/material.dart';
import 'package:market_check/config/services/remote_service/remote_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';

class StoresListTile extends StatelessWidget {
  final StoreModel storeModel;

  const StoresListTile({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
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
          title: Text(storeModel.name),
          leading: (storeModel.logo == null)
              ? const Icon(Icons.store)
              : Image.network(
                  '${RemoteUrls.currentImagesUrl}${storeModel.logo!}'),
          trailing: const Icon(
            //Icons.arrow_forward_ios_outlined,
            Icons.add_box_outlined,
            size: 30,
            color: Color(0xFFF25B50),
          ),
        ),
      ),
    );
  }
}
