import 'package:flutter/material.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';
import 'package:market_check/config/utils/constans/app_assets.dart';
import 'package:market_check/config/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "perfile-screen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.02),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.text, width: 1)),
            child: const Center(
              child: CircleAvatar(
            
                radius: 60,
                backgroundImage: AssetImage(AppAssets.avatar),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
