import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/utils/constans/app_shadows.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

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
          boxShadow: AppShadows.mainShadow,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListTile(
            title: Text(storeModel.name),
            subtitle: Text(storeModel.description!),
            leading: (storeModel.logo == null)
                ? const Icon(
                    Icons.store,
                    size: 50,
                    color: Color(0xFFF25B50),
                  )
                : SizedBox(
                    height: ScreenSize.absoluteHeight * 0.2,
                    width: ScreenSize.width * 0.14,
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                        placeholder: const AssetImage(AppAssets.loadingImage),
                        image: NetworkImage(
                          '${ServerUrls.currentImagesUrl}${storeModel.logo!}',
                        ),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.store,
                          size: 50,
                          color: Color(0xFFF25B50),
                        ),
                      ),
                    ),
                  ),
            trailing: IconButton(
              onPressed: () {
                context.read<StoresProvider>().currentStore = storeModel;
                context.push("/store-view");
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 25,
              ),
              color: const Color(0xFFF25B50),
            ),
          ),
        ),
      ),
    );
  }
}
