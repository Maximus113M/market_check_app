import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';

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
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.13)
                .copyWith(top: ScreenSize.height * 0.07),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Nombre y Apellido',
                  onChange: (nameValue) {
                    signUpProvider.names = nameValue;
                    print(signUpProvider.names);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  isNumeric: true,
                  label: 'Número de documento',
                  onChange: (documentValue) {
                    signUpProvider.document = documentValue;
                    print(signUpProvider.document);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Correo electronico',
                  onChange: (emailValue) {
                    signUpProvider.emailInput = emailValue;
                    print(signUpProvider.emailInput);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Contraseña',
                  obscureText: true,
                  onChange: (passwordValue) {
                    signUpProvider.passwordInput = passwordValue;
                    print(signUpProvider.passwordInput);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Nuevamente la contraseña',
                  obscureText: true,
                  onChange: (confirmPassword) {
                    signUpProvider.confirmPassword = confirmPassword;
                    print(signUpProvider.confirmPassword);
                  },
                ),
                const SizedBox(height: 45),
                FilledCustomButton(
                  bgColor: AppColors.appSecondary,
                  color: AppColors.appPrimary,
                  verticalSize: 10,
                  horizontalSize: ScreenSize.height * 0.09,
                  text: 'Registrarse',
                  route: "/login-form",
                  action: ()=>signUpProvider.validateSingup(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
