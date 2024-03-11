import 'package:flutter/material.dart';

import 'package:market_check/config/shared/widgets/loadings/not_found_placeholder.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_listview_m.dart';

import 'package:provider/provider.dart';

class StoresVisitedScreenBody extends StatelessWidget {
  const StoresVisitedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<ProfileProvider>().storesVisited.isEmpty
        ? const Center(
            child: NotFoundPlaceHolder(
                text:
                    'No tines compras registradas\nen ningun establecimiento...'),
          )
        : StoresListviewM(
            storeList: context.watch<ProfileProvider>().storesVisited,
          );
  }
}
