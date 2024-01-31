import 'package:flutter/material.dart';
//import 'package:market/config/theme/app_theme.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/background/carro.png'),
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
              child: Image.asset('assets/logos/logoVertical.png'),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                      horizontal: size.height * 0.1,
                      vertical: size.width * 0.03
                      ),
                ),
              ),
              child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No tienes cuenta?', style: TextStyle(color: Colors.white),),
                SizedBox(width: 8,),
                Text('Registrate', style: TextStyle(color: AppColors.appSecondary),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
