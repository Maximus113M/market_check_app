import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';

// ignore: must_be_immutable
class CustomBadge extends StatelessWidget {
  final double? height;
  final double? width;
  final double iconSize;
  final IconData icon;
  final Color? color;
  int counter;

  CustomBadge({
    super.key,
    this.height,
    this.width,
    required this.icon,
    required this.iconSize,
    this.color,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 23,
      width: width ?? 35,
      child: Stack(
        children: [
          Icon(
            icon,
            size: iconSize,
            color: counter > 0 ? color : AppColors.unfocused,
          ),
          if (counter > 0)
            Positioned(
              top: 0,
              right: 2,
              child: CircleAvatar(
                maxRadius: 8.5,
                backgroundColor: Colors.red,
                child: Text(
                  '$counter',
                  style: FontStyles.caption(AppColors.white),
                ),
              ),
            )
        ],
      ),
    );
  }
}
