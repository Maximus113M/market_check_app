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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.userLogo,
                    width: 100,
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.01,
                  ),
                  Text(
                    'Inicio de Sesión',
                    style: FontStyles.heading0(context, AppColors.text),
                  ),
                  Text(
                    'Que bueno verte de nuevo,\ncomencemos...',
                    style: FontStyles.bodyBold1(context, AppColors.lightText),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.08,
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: _LogInForm(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ScreenSize.width * 0.25,
                        child: const Divider(
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('O'),
                      ),
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
                      const Text('Ingresa con '),
                      Image.asset(
                        AppAssets.googleLogo,
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Text('¿Olvidaste la contraseña?')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LogInForm extends StatelessWidget {
  const _LogInForm();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Usuario',
            hint: 'Email@',
            onChange: (p0) {
              context.read<LoginProvider>().userInput = p0;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChange: (p0) {
              context.read<LoginProvider>().passwordInput = p0;
            },
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: ScreenSize.height * 0.04,
          ),
          const FilledCustomButton(
              text: 'Ingresar',
              color: AppColors.whiteBg,
              bgColor: AppColors.appColor2,
              route: '/home'),
        ],
      ),
    );
  }
}
