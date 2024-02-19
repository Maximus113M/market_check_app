import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.absoluteHeight * 0.03, bottom: 3),
            child: CircleAvatar(
              radius: ScreenSize.absoluteHeight * 0.08,
              backgroundImage: const AssetImage(AppAssets.avatar),
            ),
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.012,
            right: ScreenSize.width * 0.31,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_square,
                color: AppColors.appSecondary,
                size: ScreenSize.absoluteHeight * 0.032,
              ),
            ),
          )
        ],
      ),
    );
  }
}
