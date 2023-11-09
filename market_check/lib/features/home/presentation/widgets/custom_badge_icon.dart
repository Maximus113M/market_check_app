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
      onTap: () => route != null ? context.push(route!) : null,
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
                color: color,
              ),
            ),
            if (counter > 0)
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$counter',
                    style: FontStyles.caption(context, AppColors.whiteBg),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
