import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';
import 'package:market_check/config/utils/screen_size.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/login/presentation/providers/login_form_provider.dart';

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
                    height: ScreenSize.height(context) * 0.02,
                  ),
                  Text(
                    'Inicio de Sesión',
                    style: FontStyles.heading1(context, AppColors.text),
                  ),
                  Text(
                    'Que bueno verte de nuevo,\ncomencemos...',
                    style: FontStyles.bodyBold1(context, AppColors.lightText),
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.08,
                  ),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.02,
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
                        width: ScreenSize.width(context) * 0.25,
                        child: const Divider(
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('O'),
                      ),
                      SizedBox(
                        width: ScreenSize.width(context) * 0.25,
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
                    height: 20,
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

class _LogInForm extends ConsumerWidget {
  const _LogInForm();
  @override
  Widget build(BuildContext context, ref) {
    validateUser() {
      String user = ref.read(validUser);
      String password = ref.read(validPassword);
      String userInput = ref.read(inputUser);
      String passwordInput = ref.read(inputPassword);
    }

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Usuario',
            hint: 'Email@',
            onChange: (p0) {
              ref.read(inputUser.notifier).update((state) => p0);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChange: (p0) {
              ref.read(inputPassword.notifier).update((state) => p0);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: ScreenSize.height(context) * 0.04,
          ),
          FilledCustomButton(
              //    validator: validateUser(),
              text: 'Ingresar',
              horizontalSize: 85,
              verticalSize: 16,
              color: AppColors.whiteBg,
              bgColor: AppColors.appColor2,
              route: '/home'),
        ],
      ),
    );
  }
}
