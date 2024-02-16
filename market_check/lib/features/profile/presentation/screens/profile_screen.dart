import 'package:flutter/material.dart';
import 'package:market_check/config/services/auth/auth_service.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/config/shared/widgets/appbars/custom_appbar.dart';

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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: AppColors.appSecondary,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.022,
                    horizontal: ScreenSize.width * 0.04,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_bag_sharp,
                        color: AppColors.white,
                        size: ScreenSize.absoluteHeight * 0.07,
                      ),
                      /*Text(
                        '25',
                        style: FontStyles.heading10(AppColors.white),
                      ),*/
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Compras',
                        style: FontStyles.bodyBold0(AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: ScreenSize.width * 0.02,
              ),
              Card(
                color: AppColors.appSecondary,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.absoluteHeight * 0.022,
                    horizontal: ScreenSize.width * 0.04,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '25',
                        style: FontStyles.heading10(AppColors.white),
                      ),
                      Text(
                        'Compras',
                        style: FontStyles.body1(AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
