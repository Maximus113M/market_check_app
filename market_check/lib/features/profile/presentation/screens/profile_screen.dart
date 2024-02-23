import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/features/main_screen/presentation/providers/main_provider.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/profile/presentation/widgets/profile_body_screen.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "perfile-screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: customAppBar(
        isCartVisible: false,
        leading: IconButton(
          onPressed: () => mainProvider.navigateToScreen(0),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.appSecondary,
          ),
        ),
      ),
      body: ProfileBodyScreen(
        profileProvider: Provider.of<ProfileProvider>(context),
      ),
    );
  }
}
