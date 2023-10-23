import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class LeftSideOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;
  final IconData iconData;

  const LeftSideOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: ColorTheme.buttonMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
        ),
        minimumSize: SizeTheme.outlinedButtonSize,
        side: BorderSide.none,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyleTheme.textMainStyleMiddle,
              textAlign: TextAlign.left,
            ),
          ),
          Icon(
            iconData,
            size: SizeTheme.iconMiddleSize,
            color: ColorTheme.itemSubColor,
          )
        ],
      ),
    );
  }
}
