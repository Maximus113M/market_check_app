import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_listview_m.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';

import 'package:provider/provider.dart';

class StoresScreenBody extends StatelessWidget {
  const StoresScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: ScreenSize.height * 0.08),
          child: Image.asset(
            AppAssets.logoHorizontal,
            height: ScreenSize.height * 0.09,
          ),
        ),
        SizedBox(height: ScreenSize.height * 0.02),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomTextFormField(
                icon: Icons.search,
                hint: 'Buscar establecimiento',
                textController:
                    context.read<StoresProvider>().searchTextController,
                onChange: (p0) =>
                    context.read<StoresProvider>().searchStores(p0),
              ),
              if (context
                  .read<StoresProvider>()
                  .searchTextController
                  .text
                  .isNotEmpty)
                IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    color: AppColors.text,
                  ),
                  onPressed: () => context.read<StoresProvider>().clearSearch(),
                ),
            ],
          ),
        ),
        Expanded(
          child: StoresListviewM(
            storeList: context.watch<StoresProvider>().filteredStoreList,
          ),
        ),
      ],
    );
  }
}
