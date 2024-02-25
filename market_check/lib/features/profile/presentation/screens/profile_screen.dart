import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:market_check/features/profile/presentation/widgets/profile_body_screen.dart';

import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "perfile-screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(
        isCartVisible: false
      ),
      body: ProfileBodyScreen(
        profileProvider: Provider.of<ProfileProvider>(context),
      ),
    );
  }
}
