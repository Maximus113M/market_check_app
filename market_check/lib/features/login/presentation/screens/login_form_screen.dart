import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/login/presentation/providers/login_form_provider.dart';

import 'package:provider/provider.dart';

class LogInFormScreen extends StatelessWidget {
  static const String name = 'login-form';
  const LogInFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: _LogInFormView(),
    ));
  }
}

class _LogInFormView extends StatelessWidget {
  const _LogInFormView();

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
          const _LogInForm(),
          
        ],
      ),
    ));
  }
}

class _LogInForm extends StatelessWidget {
  const _LogInForm();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.height * 0.1),
      decoration: const BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.height * 0.03,
              vertical: ScreenSize.width * 0.1),
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Email',
                onChange: (p0) {
                  context.read<LoginProvider>().userInput = p0;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChange: (p0) {
                  context.read<LoginProvider>().passwordInput = p0;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: ScreenSize.height * 0.02,
              ),
              const FilledCustomButton(
                  text: 'Iniciar Sesión',
                  color: AppColors.appPrimary,
                  bgColor: AppColors.appSecondary,
                  verticalSize: 12,
                  route: '/stores'),
              const SizedBox(
                height: 9,
              ),
              GestureDetector(
                  onTap: () {}, child: const Text('¿Olvidaste la contraseña?', style: TextStyle(color: AppColors.appPrimary),)),
            ],
          ),
        ),
      ),
    );
  }
}
