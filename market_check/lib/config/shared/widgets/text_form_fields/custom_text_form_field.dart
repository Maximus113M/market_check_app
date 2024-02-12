import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final IconButton? suffixIcon;

  final String? errorMessage;
  final bool obscureText;
  final Function(String) onChange;
  final Function(String)? onComplete;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      required this.onChange,
      this.onComplete,
      this.obscureText = false,
      this.icon, 
      this.suffixIcon, 
});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: AppColors.appMainInput.withOpacity(0.7)));
    return TextFormField(
      style: TextStyle(
        height: ScreenSize.height * 0.001
      ),
      onChanged: (value) => onChange(value),
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: suffixIcon,
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
                padding:  EdgeInsets.symmetric(horizontal:ScreenSize.absoluteHeight * 0.001),
                child: Text(
                  label!,
                  style: const TextStyle(
                      color: AppColors.appPrimary, fontSize: 16),
                ),
              )
            : null,
        errorText: errorMessage,
        hintText: hint,
      ),
    );
  }
}
