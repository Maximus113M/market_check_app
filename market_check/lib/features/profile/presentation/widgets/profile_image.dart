import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:market_check/config/utils/utils.dart';
import 'package:market_check/features/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  //final String imagePath;
  final List<String> avatars;
  const ProfileImage({super.key, required this.avatars,});

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
              backgroundImage: context.read<ProfileProvider>().selectdAvatare.isEmpty ?
              AssetImage(avatars[1])
              :AssetImage(context.watch<ProfileProvider>().selectdAvatare),

            ),
          ),
          Positioned(
            top: ScreenSize.absoluteHeight * 0.012,
            right: ScreenSize.width * 0.31,
            child: IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: const Text('Seleccione su avatar'),
                  content: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: avatars.map((avatar) {
                        final index = avatars.indexOf(avatar);
                        return GestureDetector(
                          onTap: () {
                            context.read<ProfileProvider>().selectdAvatar(index);
                            print(index);
                            context.pop();
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(avatar),
                          ),
                        );
                      }).toList(),
                    )),
                ),);
              },
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
