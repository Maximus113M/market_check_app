import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';

class LogInScreen extends StatelessWidget {
  //static const String name = 'login';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ScreenSize.init(context);
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
                height: 40,
              ),
              Text('Bienvenido a Market Check',
                  style: FontStyles.heading0(AppColors.text),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text('Compras, Consultas, Listas y mucho más...',
                    style: FontStyles.body1(AppColors.lightText1),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: ScreenSize.height * 0.17,
              ),
              const FilledCustomButton(
                text: 'Ingresar',
                color: AppColors.white,
                bgColor: AppColors.appColor2,
                route: '/login-form',
              ),
              const SizedBox(
                height: 10,
              ),
              const FilledCustomButton(
                text: 'Registrase',
                horizontalSize: 75,
                color: AppColors.white,
                bgColor: Colors.black87,
                route: '/login-form',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
