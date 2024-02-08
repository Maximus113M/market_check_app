import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/login/presentation/screens/widget/login_form.dart';
import 'package:provider/provider.dart';

class LogInFormScreenBody extends StatelessWidget {
  const LogInFormScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          IconButton(
          onPressed: (){
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: ScreenSize.absoluteHeight * 0.03,),
          color: AppColors.appSecondary,
          ),
            Padding(
              padding: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.08),
              child: Image.asset(AppAssets.logoVertical),
            ),
            const SizedBox(
              height: 15,
            ),
            LogInForm(loginProvider: Provider.of<SignInProvider>(context)),
          ],
        ),
      ),
    );
  }
}