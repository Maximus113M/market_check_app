import 'package:flutter/material.dart';

import 'package:market_check/features/stores/data/models/store_model.dart';
import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_listview_m.dart';


class StoresVisitedScreenBody extends StatelessWidget {
  final List<StoreModel> storesVisited;

  const StoresVisitedScreenBody({super.key, required this.storesVisited});

  @override
  Widget build(BuildContext context) {
    return storesVisited.isEmpty
        ? const Center(
            child: NotFoundPlaceHolder(
                text:
                    'No tienes registros en\nningún establecimiento...'),
          )
        : StoresListviewM(
            storeList: storesVisited,
          );
  }
}
