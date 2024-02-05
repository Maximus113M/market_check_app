import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator,
      this.obscureText = false, 
      this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: AppColors.appMainInput.withOpacity(0.7)));
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: AppColors.appMainInput,
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null
            ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  label!,
                  style:
                      const TextStyle(color: AppColors.appPrimary, fontSize: 16),
                ),
            )
            : null,
        errorText: errorMessage,
        hintText: hint,
      ),
    );
  }
}
