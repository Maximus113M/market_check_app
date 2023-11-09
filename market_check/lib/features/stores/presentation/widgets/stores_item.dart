import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/domain/entities/store_entity.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StoreItem extends StatelessWidget {
  final StoreEntity store;

  const StoreItem({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        context.read<StoresProvider>().currentStore = store,
        context.push('/store-view')
      },
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(10),
        height: ScreenSize.height * 0.2,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  store.posterLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _buildStoreName(context),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              width: ScreenSize.width * 0.35,
              child: Text(
                store.caption ?? '',
                style: FontStyles.body2(context, AppColors.text),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildStoreName(BuildContext context) {
    return Text(
      store.name,
      style: FontStyles.subtitle1(context, AppColors.text),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}
