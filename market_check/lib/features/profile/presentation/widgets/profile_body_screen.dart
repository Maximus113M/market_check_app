import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/utils/constans/app_shadows.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/profile/presentation/widgets/profile_cards.dart';
import 'package:market_check/features/profile/presentation/widgets/profile_image.dart';

import 'package:go_router/go_router.dart';

class ProfileBodyScreen extends StatelessWidget {
  final ProfileProvider profileProvider;

  const ProfileBodyScreen({super.key, required this.profileProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /* SizedBox(
            height: ScreenSize.absoluteHeight * 0.01,
          ),*/
        const ProfileImage(),
        Text(
          AuthService.user!.name,
          style: FontStyles.subtitle1(AppColors.text),
        ),
        Text(
          AuthService.user!.email,
          style: FontStyles.body1(AppColors.unfocused),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.width * 0.035,
            vertical: ScreenSize.absoluteHeight * 0.009,
          ),
          child: SizedBox(
            height: ScreenSize.absoluteHeight * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profileProvider.menuCards.length,
              itemBuilder: (context, index) => ProfileCards(
                  title: profileProvider.menuCards[index].title,
                  imagePath: profileProvider.menuCards[index].imagePath,
                  isSelected: profileProvider.selectedIndex == index),
            ),
          ),
        ),
        profileListTile(
          'Cuenta',
          'Actualiza tus datos basicos de contacto.',
          onTap: () => context.push('/profile-details'),
        ),
        profileListTile('Cerrar Sesion', 'Esperamos verte pronto de nuevo! :)',
            onTap: () => profileProvider.signOutFromProfile(context),
            icon: Icons.logout),
        profileListTile(
            'Eliminar Cuenta', 'Elimina tu cuenta y los datos relacionados.',
            onTap: () => profileProvider.deleteAccountDialog(context),
            icon: Icons.person_off),
      ],
    );
  }

  Container profileListTile(String title, String subtitle,
      {required Function() onTap, IconData? icon}) {
    return Container(
      height: ScreenSize.absoluteHeight * 0.095,
      width: ScreenSize.width * 0.92,
      margin:
          EdgeInsets.symmetric(vertical: ScreenSize.absoluteHeight * 0.0065),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.disabled),
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppShadows.profileShadow,
        color: AppColors.white.withOpacity(0.95),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () => onTap(),
            trailing: Icon(
              icon ?? Icons.arrow_circle_right_outlined,
              color: AppColors.appSecondary,
            ),
            title: Text(
              title,
              style: FontStyles.subtitle1(AppColors.text),
            ),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
