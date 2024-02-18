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
          Container(
            margin: EdgeInsets.only(top: ScreenSize.absoluteHeight * 0.02),
            /* decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.disabled, width: 1),
            ),*/
            child: CircleAvatar(
              radius: ScreenSize.absoluteHeight * 0.08,
              backgroundImage: const AssetImage(AppAssets.avatar),
            ),
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.006,
            right: ScreenSize.width * 0.31,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_a_photo,
                color: AppColors.appSecondary,
                size: ScreenSize.absoluteHeight * 0.035,
              ),
            ),
          )
        ],
      ),
    );
  }
}
