import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.15, bottom: ScreenSize.absoluteHeight * 0.05),
            child: Image.asset(AppAssets.logoHorizontal,
            width: ScreenSize.width * 0.9,),
          ),
          const _SignUpForm()
        ]),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: ScreenSize.height * 0.67,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child:  Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05).copyWith(top: ScreenSize.height * 0.05),
            child: const Column(
              children: [
                CustomTextFormField(
                  label: 'Nombre y Apellido',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Número de documento',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Celular',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Correo electronico',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Contraseña',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Nuevamente la contraseña',
                ),
                SizedBox(height: 25),
                FilledCustomButton(
                  bgColor: AppColors.appSecondary,
                  color: AppColors.appPrimary,
                  verticalSize: 12,
                  text: 'Registrarse',
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
