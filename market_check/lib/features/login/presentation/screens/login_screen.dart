import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class LogInScreen extends StatelessWidget {
  static const String name = 'login';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF083754),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              AppAssets.logoVertical,
              height: ScreenSize.height * 0.4,
            ),
            Text('Bienvenido a Market Check',
                style: FontStyles.heading0(AppColors.textwhite),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text('Compras, Consultas, Listas y mucho más...',
                  style: FontStyles.body1(AppColors.lightTextWhite),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: ScreenSize.height * 0.08,
            ),
            const FilledCustomButton(
              text: 'Ingresar',
              color: AppColors.white,
              bgColor: AppColors.yellowButton,
              route: '/login-form',
            ),
            const SizedBox(
              height: 10,
            ),
            const FilledCustomButton(
              text: 'Registrase',
              horizontalSize: 75,
              color: AppColors.white,
              bgColor: AppColors.grayButton,
              route: '/login-form',
            ),
          ],
        ),
      ),
    );
  }
}
