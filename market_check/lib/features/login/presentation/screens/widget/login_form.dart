import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';

class LogInForm extends StatelessWidget {
  final SignInProvider loginProvider;

  const LogInForm({super.key, required this.loginProvider});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: ScreenSize.absoluteHeight * 0.41,
        margin: EdgeInsets.only(top: ScreenSize.height * 0.1),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.height * 0.04,
                vertical: ScreenSize.width * 0.10),
            child: Column(
              children: [
                CustomTextFormField(
                  icon: Icons.email_rounded,
                  label: 'Email',
                  onChange: (emailValue) {
                    loginProvider.emailInput = emailValue;
                    print(loginProvider.emailInput);
                  },
                ),
                 SizedBox(
                  height: ScreenSize.absoluteHeight * 0.02 ,
                ),
                CustomTextFormField(
                  icon: Icons.lock,
                  obscureText: loginProvider.obscureText,
                  suffixIcon: IconButton(
                    icon: loginProvider.obscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      loginProvider.toggleObscureText();
                    },
                  ),
                  label: 'Contraseña',
                  onChange: (passwordValue) {
                    loginProvider.passwordInput = passwordValue;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: ScreenSize.height * 0.015,
                ),
                FilledCustomButton(
                  text: 'Iniciar Sesión',
                  color: AppColors.appPrimary,
                  bgColor: AppColors.appSecondary,
                  verticalSize: 13,
                  action: () => loginProvider.validateUser(context),
                ),
                const SizedBox(
                  height: 9,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    '¿Olvidaste la contraseña?',
                    style: TextStyle(color: AppColors.appPrimary),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push("/register");
                  },
                  child: const Text(
                    'Registrate',
                    style: TextStyle(
                        color: AppColors.appSecondary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
