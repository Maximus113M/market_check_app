import 'package:flutter/material.dart';
import 'package:market_check/config/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final IconButton? suffixIcon;
  final bool isNumeric;
  final bool isEnable;
  final TextEditingController? textController;

  final String? errorMessage;
  final bool obscureText;
  final Function(String) onChange;
  final Function(String)? onComplete;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    required this.onChange,
    this.onComplete,
    this.obscureText = false,
    this.icon,
    this.suffixIcon,
    this.isNumeric = false,
    this.isEnable = true,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: AppColors.appMainInput.withOpacity(1),
      ),
    );
    return TextFormField(
      enabled: isEnable,
      controller: textController,
      keyboardType: isNumeric ? TextInputType.number : null,
      style: TextStyle(height: ScreenSize.height * 0.001),
      onChanged: (value) => onChange(value),
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        prefixIcon: icon != null
            ? Icon(icon, color: isEnable ? null : AppColors.unfocused)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.appMainInput2,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.absoluteHeight * 0.001),
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
