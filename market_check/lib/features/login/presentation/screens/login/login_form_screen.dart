import 'package:flutter/material.dart';

import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/login/presentation/screens/login/login_form_body_screen.dart';


class LogInFormScreen extends StatelessWidget {
  static const String name = 'login-form';
  const LogInFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          backgroundColor: AppColors.appPrimary,
          body: LogInFormScreenBody(),
        );
  }
}


