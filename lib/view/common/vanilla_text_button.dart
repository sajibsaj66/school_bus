import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class VanillaTextButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;

  const VanillaTextButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: SizeTheme.textButtonSize,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyleTheme.textMainStyleSmall,
      ),
    );
  }
}
