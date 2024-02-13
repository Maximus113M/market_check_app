import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
//import 'package:market/config/theme/app_theme.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/screen_size.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundHome),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color(0xFF486174).withOpacity(0.2), BlendMode.dstATop),
          ),
          color: AppColors.appPrimary,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.2),
              child: Image.asset(AppAssets.logoVertical),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () => context.pushReplacement("/login-form"),
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                      horizontal: size.height * 0.1,
                      vertical: size.width * 0.03),
                ),
              ),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No tienes cuenta?',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => context.push("/register"),
                  child: const Text(
                    'Registrate',
                    style: TextStyle(color: AppColors.appSecondary, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
