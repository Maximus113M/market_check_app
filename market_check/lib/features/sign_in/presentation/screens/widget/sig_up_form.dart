import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  final SignInProvider signUpProvider;
  const SignUpForm({super.key, required this.signUpProvider});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: ScreenSize.height * 0.70,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.13)
                .copyWith(top: ScreenSize.height * 0.07),
            child: Column(
              children: [
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Nombre y Apellido',
                  onChange: (nameValue) {
                    signUpProvider.names = nameValue;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  isNumeric: true,
                  label: 'Número de documento',
                  onChange: (documentValue) {
                    signUpProvider.document = documentValue;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Correo electronico',
                  onChange: (emailValue) {
                    signUpProvider.emailInput = emailValue;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Contraseña',
                  obscureText: true,
                  onChange: (passwordValue) {
                    signUpProvider.passwordInput = passwordValue;
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Nuevamente la contraseña',
                  obscureText: true,
                  onChange: (confirmPassword) {
                    signUpProvider.confirmPassword = confirmPassword;
                  },
                ),
                const SizedBox(height: 45),
                CustomButton(
                  radius: 0.5,
                  color: AppColors.appPrimary,
                  text: 'REGISTRATE',
                  action: () => signUpProvider.validateSingUp(context),
                  horizontalMargin: 0,
                  verticalSize: 0.055,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
