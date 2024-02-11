import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/presentation/providers/stores_provider.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_listview_m.dart';

class StoresScreenM extends StatelessWidget {
  static const String name = 'stores-m';
  const StoresScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSize.height * 0.1),
            child: Image.asset(AppAssets.logoHorizontal,
            height: ScreenSize.height * 0.09,),
          ),
          SizedBox(height: ScreenSize.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              icon: Icons.search,
              hint: 'Buscar establecimiento',
              onChange: (p0) {},
            ),
          ),
          const Expanded(child: StoresListviewM()),

          ElevatedButton(
          onPressed: (){
            context.push("/offers-m");
          }, 
          child: Text('Offers'))
        ],
      ),
    );
  }
}
