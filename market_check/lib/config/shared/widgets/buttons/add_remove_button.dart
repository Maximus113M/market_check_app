import 'package:flutter/material.dart';
import 'package:market_check/config/utils/constans/app_colors.dart';
import 'package:market_check/config/utils/constans/font_styles.dart';

class AddRemoveButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? containerBg;
  final Color? addBg;
  final double? iconSize;
  final Color? removeColor;
  final Color? addColor;
  final int count;
  final VoidCallback? addAction;
  final VoidCallback? removeAction;

  const AddRemoveButton(
      {super.key,
      this.height,
      this.width,
      this.containerBg,
      this.addBg,
      this.iconSize,
      this.removeColor,
      this.addColor,
      required this.count,
      this.addAction,
      this.removeAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerBg ?? Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              highlightColor: Colors.amber.shade300,
              icon: Icon(
                Icons.remove,
                color: removeColor ?? AppColors.lightText,
                size: iconSize ?? 18,
              ),
              onPressed: removeAction),
          Text(
            count.toString(),
            style: FontStyles.bodyBold1(AppColors.text),
          ),
          IconButton.filled(
              highlightColor: Colors.amber,
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor:
                    MaterialStatePropertyAll(addBg ?? Colors.black26),
              ),
              icon: Icon(
                Icons.add,
                color: addColor ?? AppColors.white,
                size: iconSize ?? 18,
              ),
              onPressed: addAction),
        ],
      ),
    );
  }
}
