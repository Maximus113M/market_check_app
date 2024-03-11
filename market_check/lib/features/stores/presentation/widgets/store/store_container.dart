import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/features/stores/presentation/widgets/store/store_menu.dart';

class StoreContainer extends StatelessWidget {
  final StoreModel store;
  const StoreContainer({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.3),
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.absoluteHeight * 0.03,
        horizontal: ScreenSize.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.disabled),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ScreenSize.width * 0.075),
          topLeft: Radius.circular(ScreenSize.width * 0.075),
        ),
      ),
      child: Column(
        children: [
          Text(
            store.name,
            style: FontStyles.heading9(AppColors.appSecondary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ScreenSize.absoluteHeight * 0.02,
          ),
          Text(
            store.description ?? '¡Qué gusto verte!',
            style: FontStyles.body3(AppColors.text),
            maxLines: 10,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          StoreMenu(
            descriptionLength:
                store.description != null ? store.description!.length : 0,
          )
        ],
      ),
    );
  }
}
