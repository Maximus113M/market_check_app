import 'package:flutter/material.dart';

import 'package:market_check/config/utils/utils.dart';

import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class CustomBadge extends StatelessWidget {
  final double? height;
  final double? width;
  final String? route;
  final double iconSize;
  final IconData icon;
  final Color? color;
  int counter;

  CustomBadge({
    super.key,
    this.route,
    this.height,
    this.width,
    required this.icon,
    required this.iconSize,
    this.color,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(route!),
      child: SizedBox(
        height: height ?? 38,
        width: width ?? 38,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 5),
              child: Icon(
                icon,
                size: iconSize,
                color: counter > 0 ? color : AppColors.unfocused,
              ),
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
      ),
    );
  }
}
