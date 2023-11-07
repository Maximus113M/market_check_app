import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';

class StoreItem extends StatelessWidget {
  final StoreEntity store;
  // _StoreListTile(store: context.read<StoresProvider>().storeList)
  const StoreItem({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(10),
      height: ScreenSize.height(context) * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 1),
            )
          ],
          color: Colors.grey.shade50),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    store.poster,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                store.name,
                style: FontStyles.bodyBold1(context, AppColors.text),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                store.caption ?? '',
                style: FontStyles.body3(context, AppColors.text),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: ScreenSize.width(context) * 0.085,
            child: const FilledCustomButton(
                text: 'Ver',
                horizontalSize: 10,
                verticalSize: 5,
                bgColor: AppColors.blueButton,
                route: '/home'),
          )
        ],
      ),
    );
  }
}
