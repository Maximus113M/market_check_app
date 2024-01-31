import 'package:flutter/material.dart';

import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/login/presentation/providers/login_form_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LogInFormScreen extends StatelessWidget {
  static const String name = 'login-form';
  const LogInFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF083754),
      body: _LogInFormView(),
    ));
  }
}

class _LogInFormView extends StatelessWidget {
  const _LogInFormView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white),
          Image.asset(
            AppAssets.logoVertical,
            height: ScreenSize.height * 0.4,
          ),
          SizedBox(
            height: ScreenSize.height * 0.02,
          ),
          const _LogInForm(),
        ],
      )),
    );
  }
}

class _LogInForm extends StatelessWidget {
  const _LogInForm();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      width: double.infinity,
      height: ScreenSize.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(20)
          ),
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05, vertical: ScreenSize.height *0.05),
              child: CustomTextFormField(
                label: 'Usuario',
                hint: 'Email@',
                onChange: (p0) {
                  context.read<LoginProvider>().userInput = p0;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05,),
              child: CustomTextFormField(
                label: 'Contraseña',
                obscureText: true,
                onChange: (p0) {
                  context.read<LoginProvider>().passwordInput = p0;
                },
              ),
            ),
            SizedBox(
              height: ScreenSize.height * 0.04,
            ),
            const FilledCustomButton(
                text: 'Iniciar Sesión',
                horizontalSize: 50,
                color: AppColors.white,
                bgColor: AppColors.yellowButton,
                route: '/home'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenSize.width * 0.25,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                /*const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('O'),
                ),*/
                SizedBox(
                  width: ScreenSize.width * 0.25,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const Text('Ingresa con '),
                Image.asset(
                  AppAssets.googleLogo,
                  width: 30,
                ),*/
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
                onTap: () {}, child: const Text('¿Olvidaste la contraseña?')),
          ],
        ),
      ),
    );
  }
}
