import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class CentralOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;

  const CentralOutlinedButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

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
      child: Text(
        text,
        style: TextStyleTheme.textMainStyleMiddle,
      ),
    );
  }
}
