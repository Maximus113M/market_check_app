import 'package:flutter/material.dart';
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
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.absoluteHeight * 0.15,
                bottom: ScreenSize.absoluteHeight * 0.05),
            child: Image.asset(
              AppAssets.logoHorizontal,
              width: ScreenSize.width * 0.9,
            ),
          ),
          const SignUpForm()
        ]),
      ),
    );
  }
}

