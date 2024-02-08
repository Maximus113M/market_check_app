import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/screen_size.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: ScreenSize.height * 0.64,
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.13)
                .copyWith(top: ScreenSize.height * 0.05),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Nombre y Apellido',
                  onChange: (p0) {},
                ),
                const SizedBox(height: 23),
                CustomTextFormField(
                  label: 'Número de documento',
                  onChange: (p0) {},
                ),
                const SizedBox(height: 23),
                CustomTextFormField(
                  label: 'Celular',
                  onChange: (p0) {},
                ),
                const SizedBox(height: 23),
                CustomTextFormField(
                  label: 'Correo electronico',
                  onChange: (p0) {},
                ),
                const SizedBox(height: 23),
                CustomTextFormField(
                  label: 'Contraseña',
                  obscureText: true,
                  onChange: (p0) {},
                ),
                const SizedBox(height: 23),
                CustomTextFormField(
                  label: 'Nuevamente la contraseña',
                  obscureText: true,
                  onChange: (p0) {},
                ),
                const SizedBox(height: 30),
                FilledCustomButton(
                  bgColor: AppColors.appSecondary,
                  color: AppColors.appPrimary,
                  verticalSize: 10,
                  horizontalSize: ScreenSize.height * 0.09,
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
