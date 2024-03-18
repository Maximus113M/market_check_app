import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_button.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/config/shared/widgets/text_form_fields/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  final SignInProvider signInProvider;
  const SignUpForm({super.key, required this.signInProvider});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: ScreenSize.height * 0.72,
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
                .copyWith(top: ScreenSize.height * 0.045),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Nombre y Apellido',
                  onChange: (nameValue) {
                    signInProvider.names = nameValue;
                  },
                ),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  isNumeric: true,
                  label: 'Número de documento',
                  onChange: (documentValue) {
                    signInProvider.document = documentValue;
                  },
                ),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Correo electronico',
                  onChange: (emailValue) {
                    signInProvider.emailInput = emailValue;
                  },
                ),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                _buildStateDropdown(),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                _buildCityDropdown(),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Contraseña',
                  obscureText: true,
                  onChange: (passwordValue) {
                    signInProvider.passwordInput = passwordValue;
                  },
                ),
                SizedBox(height: ScreenSize.absoluteHeight * 0.025),
                CustomTextFormField(
                  verticalPadding: 0.018,
                  horizontalPadding: 0.042,
                  label: 'Nuevamente la contraseña',
                  obscureText: true,
                  onChange: (confirmPassword) {
                    signInProvider.confirmPassword = confirmPassword;
                  },
                ),
                SizedBox(height: ScreenSize.absoluteHeight * 0.045),
                CustomButton(
                  radius: 0.5,
                  color: AppColors.appPrimary,
                  text: 'REGISTRATE',
                  action: () => signInProvider.validateSingUp(context),
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

  Container _buildStateDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.height * 0.012,
        horizontal: ScreenSize.width * 0.05,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.disabled),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: AppColors.appMainInput2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          menuMaxHeight: ScreenSize.height * 0.4,
          value: signInProvider.state,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.text,
          ),
          elevation: 16,
          dropdownColor: AppColors.white,
          style: TextStyle(
            color: AppColors.appPrimary,
            fontSize: ScreenSize.width * 0.036,
          ),
          underline: null,
          hint: const Text("Departamento"),
          onChanged: (newValue) {
            signInProvider.updateStateValue(newValue!);
            signInProvider.getCities(newValue);
          },
          items: signInProvider.states
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Container _buildCityDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize.height * 0.012,
        horizontal: ScreenSize.width * 0.05,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.disabled),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: AppColors.appMainInput2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          isExpanded: true,
          value: signInProvider.city.isEmpty ? null : signInProvider.city,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.text,
          ),
          elevation: 16,
          dropdownColor: AppColors.white,
          style: TextStyle(
            color: AppColors.appPrimary,
            fontSize: ScreenSize.width * 0.036,
          ),
          underline: null,
          hint: const Text("Ciudad"),
          onChanged: (String? newValue) {
            signInProvider.updateCityValue(newValue!);
          },
          items: signInProvider.currentCities
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
