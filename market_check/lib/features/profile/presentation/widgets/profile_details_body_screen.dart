import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/utils/constans/app_shadows.dart';
import 'package:market_check/config/shared/widgets/shared_widgets.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';

class ProfileDetailsBodyScreen extends StatefulWidget {
  final ProfileProvider profileProvider;

  const ProfileDetailsBodyScreen({super.key, required this.profileProvider});

  @override
  State<ProfileDetailsBodyScreen> createState() =>
      _ProfileDetailsBodyScreenState();
}

class _ProfileDetailsBodyScreenState extends State<ProfileDetailsBodyScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String password = '';
  String confirmPassword = '';
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  bool isValidPassword = false;
  bool isPasswordSet= false;

  void onChangePassword(String value) {
    password = value;
    if (password.isNotEmpty && password.length >= 6) {
      isValidPassword = true;
      setState(() {});
      return;
    }
    isValidPassword = false;
    setState(() {});
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    setState(() {});
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    setState(() {});
  }

  void validateFields() {
    if (password.isNotEmpty) {
      if (password != confirmPassword) {
        InAppNotification.showAppNotification(
          context: context,
          title: 'Contraseña Inválida!',
          message:
              'Las contraseñas deben ser de 5 o más caracteres y deben coincidir.',
          type: NotificationType.warning,
        );
        return;
      }
      isPasswordSet= true;
    }
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        documentController.text.trim().isEmpty) {
      InAppNotification.showAppNotification(
        context: context,
        title: 'Campos incompletos!',
        message: 'Debes completar todos los campos.',
        type: NotificationType.warning,
      );
      return;
    }
    if (documentController.text.contains('-') ||
        documentController.text.contains(',') ||
        documentController.text.contains('.')) {
      InAppNotification.showAppNotification(
        context: context,
        title: 'Datos invalidos!',
        message: 'El documento no debe contener signos de puntuación',
        type: NotificationType.warning,
      );
      return;
    }

    if(isPasswordSet){
      //DOS CASOS DE USO
    }else{
      //Solo update
    }

    InAppNotification.showAppNotification(
      context: context,
      title: 'Datos Actualizados!',
      message: 'Tu información ha sido actualizada exitosamente.',
      type: NotificationType.success,
    );
  }

  @override
  void initState() {
    super.initState();
    nameController.text = AuthService.user!.name;
    documentController.text = AuthService.user!.document;
    emailController.text = AuthService.user!.email;
  }

  @override
  void dispose() {
    nameController.dispose();
    documentController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.05,
              vertical: ScreenSize.absoluteHeight * 0.04,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.05,
              vertical: ScreenSize.absoluteHeight * 0.02,
            ).copyWith(bottom: ScreenSize.absoluteHeight * 0.05),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.disabled, width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppShadows.profileShadow,
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos Basicos',
                  style: FontStyles.subtitle0(AppColors.text),
                ),
                formTitle(
                  title: 'Nombre',
                  controller: nameController,
                  icon: Icons.person,
                  onChange: (p0) => nameController.text = p0,
                ),
                formTitle(
                  title: 'Documento',
                  controller: documentController,
                  icon: Icons.numbers,
                  isNumeric: true,
                  onChange: (p0) => documentController.text = p0,
                ),
                formTitle(
                  title: 'Correo',
                  controller: emailController,
                  icon: Icons.mail,
                  onChange: (p0) => emailController.text = p0,
                ),
                formTitle(
                  title: 'Contraseña',
                  isObscure: isPasswordObscure,
                  icon: Icons.lock,
                  onChange: (p0) => onChangePassword(p0),
                  showPassword: IconButton(
                    onPressed: () => togglePasswordVisibility(),
                    icon: Icon(isPasswordObscure
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                formTitle(
                  title: 'Confirma la Contraseña',
                  isObscure: isConfirmPasswordObscure,
                  isEnable: isValidPassword,
                  icon: Icons.lock,
                  onChange: (p0) => confirmPassword = p0,
                  showPassword: IconButton(
                    onPressed: () => toggleConfirmPasswordVisibility(),
                    icon: Icon(isConfirmPasswordObscure
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.absoluteHeight * 0.05,
                ),
                FilledCustomButton(
                  text: 'GUARDAR',
                  verticalSize: ScreenSize.absoluteHeight * 0.019,
                  horizontalSize: ScreenSize.width * 0.24,
                  bgColor: AppColors.appSecondary,
                  action: () => validateFields(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding formTitle({
    required String title,
    required Function(String) onChange,
    required IconData icon,
    TextEditingController? controller,
    bool isNumeric = false,
    bool isEnable = true,
    bool isObscure = false,
    IconButton? showPassword,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FontStyles.bodyBold1(AppColors.text),
          ),
          const SizedBox(
            height: 3,
          ),
          CustomTextFormField(
            textController: controller,
            obscureText: isObscure,
            isEnable: isEnable,
            isNumeric: isNumeric,
            icon: icon,
            onChange: (p0) => onChange(p0),
            suffixIcon: showPassword,
          ),
        ],
      ),
    );
  }
}
