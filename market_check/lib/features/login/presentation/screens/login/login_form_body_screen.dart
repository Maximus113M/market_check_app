import 'package:flutter/material.dart';
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
            Padding(
              padding: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.1),
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