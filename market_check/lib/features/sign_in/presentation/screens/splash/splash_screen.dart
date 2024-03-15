import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final SignInProvider signInProvider;

  const SplashScreen({super.key, required this.signInProvider});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ScreenSize.init(context);
      widget.signInProvider.verifyCurrentSession(context);
      await widget.signInProvider.getColombiaData(context);
      widget.signInProvider.getCities("Santander");

      //final dir = await getApplicationDocumentsDirectory();
      //await initializeDateFormatting('es_CO', '');
      //Intl.defaultLocale = 'es_CO';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/lottie/splashscreen.json',
          ),
        ),
      ),
    );
  }
}
