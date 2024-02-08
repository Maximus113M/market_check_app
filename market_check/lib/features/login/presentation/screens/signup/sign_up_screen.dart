import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/login/presentation/screens/widget/sig_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: ScreenSize.height * 0.07),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new,
                  size: ScreenSize.absoluteHeight * 0.03),
              color: AppColors.appSecondary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenSize.absoluteHeight * 0.05,
              bottom: ScreenSize.absoluteHeight * 0.05,
            ),
            child: Image.asset(
              AppAssets.logoHorizontal,
              width: ScreenSize.width * 0.85,
            ),
          ),
          const SignUpForm()
        ]),
      ),
    );
  }
}
