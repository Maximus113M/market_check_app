import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';
import 'package:market_check/config/utils/constans/app_shadows.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/profile/presentation/screens/widgets/profile_cards.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "perfile-screen";
  final ProfileProvider profileProvider;

  const ProfileScreen({super.key, required this.profileProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.02),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.disabled, width: 1),
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage(AppAssets.avatar),
              ),
            ),
          ),
          Text(
            AuthService.user!.name,
            style: FontStyles.subtitle0(AppColors.text),
          ),
          Text(
            AuthService.user!.email,
            style: FontStyles.body0(AppColors.unfocused),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.03,
              vertical: ScreenSize.absoluteHeight * 0.025,
            ),
            child: SizedBox(
              height: ScreenSize.absoluteHeight * 0.2,
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
        ],
      ),
    );
  }
}
