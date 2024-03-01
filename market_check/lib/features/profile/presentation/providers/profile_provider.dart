import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/shared/models/create_user_data_model.dart';
import 'package:market_check/config/shared/models/user.dart';
import 'package:market_check/config/shared/widgets/dialogs/confirm_dialog.dart';
import 'package:market_check/config/use_case/use_case.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/constans/in_app_notification.dart';
import 'package:market_check/features/sign_in/presentation/providers/sign_in_provider.dart';
import 'package:market_check/features/profile/data/models/profile_cards_model.dart';
import 'package:market_check/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:market_check/features/profile/domain/use_cases/update_account_data_use_case.dart';
import 'package:market_check/features/profile/domain/use_cases/update_password_use_case.dart';
import 'package:provider/provider.dart';

class ProfileProvider with ChangeNotifier {
  final DeleteAccountUseCase deleteAccountUseCase;
  final UpdateAccountDataUseCase updateAccountDataUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  bool isLoading = false;
  final List<String> avatars = AppAssets.avatarList;
  int selectdAvatare = 0;
  

  ProfileProvider({
    required this.deleteAccountUseCase,
    required this.updateAccountDataUseCase,
    required this.updatePasswordUseCase,
  });

  int selectedIndex = 0;
  List<ProfileCardsModel> menuCards = ProfileCardsModel.profileCardsMenu;

  void setIndex(int index) {
    selectedIndex = index;
  }

  void updateAccount({
    required BuildContext context,
    required SignUpDataModel userData,
    required bool isPasswordSet,
  }) async {
    if (isLoading) return;
    isLoading = true;

    if (isPasswordSet) {
      bool isPasswordUpdated = false;
      final result = await updatePasswordUseCase(userData.password!);
      result.fold((l) {
        InAppNotification.serverFailure(
          context: context,
          message: l.message,
        );
        isLoading = false;
      }, (r) => isPasswordUpdated = r);

      if (!isPasswordUpdated) return;
    }
    final result = await updateAccountDataUseCase(userData);
    result.fold(
      (l) => InAppNotification.serverFailure(
        context: context,
        message: l.message,
      ),
      (r) => InAppNotification.showAppNotification(
          context: context,
          title: '$r!',
          message: 'Tus datos ha sido actualizados exitosamente',
          type: NotificationType.success),
    );

    isLoading = false;
    notifyListeners();
  }

  void signOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: 'Cerrar Sesión',
        message: '¿Deseas cerrar sesión?',
        mainAction: () => signOutFromProfile(context),
      ),
    );
  }

  void signOutFromProfile(BuildContext context) {
    Provider.of<SignInProvider>(context, listen: false).signOut(context);
  }

  void deleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: 'Eliminar Cuenta',
        message:
            'Esta accion no se puede revertir, ¿estas seguro que quieres continuar?',
        mainAction: () => deleteAccount(context),
      ),
    );
  }

  void deleteAccount(BuildContext context) async {
    final result = await deleteAccountUseCase(NoParams());

    result.fold(
        (l) => InAppNotification.serverFailure(
              context: context,
              message: l.message,
            ), (r) {
      InAppNotification.showAppNotification(
        context: context,
        title: r,
        message:
            'La cuenta ha sido eliminada exitosamente, los datos relacionados han sido borrados. Esperamos verte de nuevo...',
        type: NotificationType.success,
      );
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => context.pushReplacement('/login-form'),
      );
      //context.p
    });
  }

  

  void selectdAvatar(int index) async{
    selectdAvatare = index;
    User currentUser= AuthService.user!;
    /*AuthService.user = User(
      name: currentUser.name, 
      document: currentUser.document, 
      email: currentUser.email, 
      rolId: currentUser.rolId, 
      profileImage: selectdAvatare);*/
      final result = await updateAccountDataUseCase(SignUpDataModel(
        name: currentUser.name, 
        document: int.tryParse(currentUser.document), 
        email: currentUser.email, 
        password: null,
        profileImage: selectdAvatare
        ));

      result.fold(
        (l) => null, 
        (r) => null);


    notifyListeners();
  } 
}
