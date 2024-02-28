import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/sign_in/presentation/screens/widget/sig_up_form.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimary,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appSecondary,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              top: ScreenSize.absoluteHeight * 0.04,
              bottom: ScreenSize.absoluteHeight * 0.07,
            ),
            child: Image.asset(
              AppAssets.logoHorizontal,
              width: ScreenSize.width * 0.86,
            ),
          ),
          SignUpForm(
            signUpProvider: Provider.of<SignInProvider>(context),
          )
        ]),
      ),
    );
  }
}
