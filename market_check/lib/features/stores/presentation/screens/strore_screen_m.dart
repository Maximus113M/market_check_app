import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/stores/presentation/widgets/stores_listView_m.dart';

class StoresScreenM extends StatelessWidget {
  const StoresScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSize.height * 0.1),
            child: Image.asset('assets/Images/logos/logoHorizontal.png',
            height: ScreenSize.height * 0.09,),
          ),
          SizedBox(height: ScreenSize.height * 0.03),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomTextFormField(
            icon: Icons.search,
            hint: 'Buscar establecimiento',
          ),
        ),
        const StoresListViewM(),
        ],
      ),
    );
  }
}


