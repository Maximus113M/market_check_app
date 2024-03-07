import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';
import 'package:market_check/config/utils/utils.dart';

class CustomImersiveDialog extends StatelessWidget {
  final String disableOptionTitle;
  final String? okOptionTitle;
  final Widget contentBody;
  final Function()? disableOption;
  final Function() okOption;

  const CustomImersiveDialog({
    super.key,
    required this.disableOptionTitle,
    required this.contentBody,
    this.disableOption,
    required this.okOption,
    this.okOptionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        //surfaceTintColor: AppColors.text,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Hey ${AuthService.user!.name.split(' ')[0]}!',
          style: FontStyles.subtitle0(AppColors.white),
          textAlign: TextAlign.center,
        ),
        content: contentBody,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomFilledButton(
            text: okOptionTitle ?? 'Ok',
            fontStyle: FontStyles.bodyBold0(AppColors.text),
            action: () => okOption(),
            bgColor: AppColors.white.withOpacity(0.8),
            verticalSize: 0.01,
          ),
        ],
      ),
    );
  }
}
