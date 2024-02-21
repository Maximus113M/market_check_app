import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/buttons/custom_filled_button.dart';

import 'package:go_router/go_router.dart';

class EndShoppingDialog extends StatelessWidget {
  final String code;
  const EndShoppingDialog({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetAnimationCurve: Curves.bounceIn,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(ScreenSize.absoluteHeight * 0.04),
          child: Column(
            children: [
              Text(
                'Ya casi es tuyo!',
                style: FontStyles.heading2(AppColors.blueButton1),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Ve a la caja mas cercana con el siguiente codigo para finalizar tu compra.',
                  style: FontStyles.body2(AppColors.lightText),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:
                    Text(code, style: FontStyles.heading0(AppColors.appColor3)),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              CustomFilledButton(
                horizontalSize: 10,
                verticalSize: 5,
                text: 'Ok',
                action: () => context.push('/home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
