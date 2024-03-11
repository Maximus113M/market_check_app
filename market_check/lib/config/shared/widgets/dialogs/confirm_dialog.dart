import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';

import 'package:go_router/go_router.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function() mainAction;
  const ConfirmDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.mainAction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: FontStyles.subtitle0(AppColors.appSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: FontStyles.body2(AppColors.text),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomFilledButton(
          text: 'Ok',
          color: AppColors.white,
          bgColor: AppColors.appSecondary.withOpacity(0.55),
          horizontalSize: 0.08,
          action: () => mainAction(),
        ),
        CustomFilledButton(
          text: 'Cancelar',
          horizontalSize: 0.035,
          bgColor: AppColors.appSecondary.withOpacity(0.9),
          action: () => context.pop(),
        ),
      ],
    );
  }
}
