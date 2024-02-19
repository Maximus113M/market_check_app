import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/login/presentation/providers/sign_in_provider.dart';

class SplashScreen extends StatefulWidget {
  final SignInProvider signInProvider;

  const SplashScreen({super.key, required this.signInProvider});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    if (mounted) {
      ScreenSize.init(context);
      widget.signInProvider.verifyCurrentSession(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AppAssets.backgroundHome),
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
                horizontal: ScreenSize.width * 0.1,
                vertical: ScreenSize.height * 0.2,
              ),
              child: Image.asset(AppAssets.logoVertical),
            ),
            SizedBox(height: ScreenSize.height * 0.1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Listas, compras y ',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'mucho mas!',
                  style: TextStyle(color: AppColors.appSecondary, fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
