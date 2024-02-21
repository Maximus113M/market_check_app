import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';

import 'package:market_check/config/utils/utils.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  const ConfirmDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: FontStyles.subtitle1(AppColors.appSecondary),
          ),
          Divider(
            indent: ScreenSize.width * 0.1,
            endIndent: ScreenSize.width * 0.1,
            color: AppColors.appSecondary,
            thickness: 2,
          ),
        ],
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: FontStyles.body2(AppColors.text),
            ),
          ],
        ),
      ),
      actions: [
        CustomFilledButton(
          text: 'Ok',
          bgColor: AppColors.appSecondary,
          verticalSize: 0,
          horizontalSize: 0.055,
          action: () {},
        ),
        CustomFilledButton(
          text: 'Cancelar',
          bgColor: AppColors.appSecondary,
          verticalSize: 0,
          horizontalSize: 0,
          action: () => context.pop(),
        ),
      ],
    );
  }
}
