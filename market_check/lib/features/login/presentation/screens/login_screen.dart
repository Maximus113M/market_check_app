import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class LogInScreen extends StatelessWidget {
  static const String name = 'login';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(6, 8))
                        ]),
                    child: Image.asset(
                      AppAssets.optionalLogoImage,
                      height: 200,
                      width: 200,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text('Bienvenido a Market Check',
                  style: FontStyles.heading1(context, AppColors.text),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              Text('Compras, Consultas, Listas y mucho más...',
                  style: FontStyles.body1(context, AppColors.lightText),
                  textAlign: TextAlign.center),
              SizedBox(
                height: ScreenSize.height(context) * 0.13,
              ),
              const LoginCustomButton(
                text: 'Ingresar',
                horizontalSize: 85,
                verticalSize: 16,
                color: Color.fromARGB(255, 12, 172, 241),
                route: '/login-form',
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginCustomButton(
                text: 'Registrase',
                horizontalSize: 75,
                verticalSize: 16,
                color: Colors.black87,
                route: '/login-form',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
