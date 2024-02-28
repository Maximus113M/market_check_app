import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/server/server_urls.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StoresItemTile extends StatelessWidget {
  final StoreModel storeModel;

  const StoresItemTile({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: ScreenSize.absoluteHeight * 0.1,
        decoration: BoxDecoration(
          boxShadow: AppShadows.profileShadow,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.02,
                  vertical: ScreenSize.absoluteHeight * 0.007),
              child: SizedBox(
                height: ScreenSize.absoluteHeight * 0.08,
                width: ScreenSize.width * 0.2,
                child: (storeModel.logo == null)
                    ? const Icon(
                        Icons.store,
                        size: 50,
                        color: AppColors.appSecondary,
                      )
                    : SizedBox(
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage(AppAssets.loadingImage),
                            image: NetworkImage(
                              '${ServerUrls.currentImagesUrl}${storeModel.logo!}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width * 0.013,
                  vertical: ScreenSize.absoluteHeight * 0.003),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: ScreenSize.width * 0.52,
                        minWidth: ScreenSize.width * 0.52,
                        maxHeight: ScreenSize.absoluteHeight * 0.09),
                    child: Text(
                      storeModel.name,
                      style: FontStyles.bodyBold1(AppColors.text),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.width * 0.52,
                    child: Text(
                      storeModel.description!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
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
          ],
        ),
      ),
    );
  }
}
