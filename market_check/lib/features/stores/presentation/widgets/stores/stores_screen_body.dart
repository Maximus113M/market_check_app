import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores/stores_listview_m.dart';
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
            child: CustomTextFormField(
              icon: Icons.search,
              hint: 'Buscar establecimiento',
              onChange: (p0) {},
            ),
          ),
          Expanded(
            child: StoresListviewM(
              storeList: context.watch<StoresProvider>().storeList,
            ),
          ),
        ],
      );
  }
}