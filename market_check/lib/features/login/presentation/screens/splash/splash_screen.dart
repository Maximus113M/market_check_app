import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:lottie/lottie.dart';
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
