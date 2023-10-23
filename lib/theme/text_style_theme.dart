import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'size_theme.dart';

class TextStyleTheme {
  static const TextStyle textMainStyleLarge = TextStyle(
    color: ColorTheme.textMainColor,
    fontSize: SizeTheme.textLargeSize,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    height: SizeTheme.textHeight,
  );

  static const TextStyle textMainStyleMiddle = TextStyle(
    color: ColorTheme.textMainColor,
    fontSize: SizeTheme.textMiddleSize,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    height: SizeTheme.textHeight,
  );

  static const TextStyle textDisableStyleMiddle = TextStyle(
    color: ColorTheme.textDisableColor,
    fontSize: SizeTheme.textMiddleSize,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    height: SizeTheme.textHeight,
  );

  static const TextStyle textMainStyleSmall = TextStyle(
    color: ColorTheme.textMainColor,
    fontSize: SizeTheme.textSmallSize,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    height: SizeTheme.textHeight,
  );

  static const TextStyle textMainStyleMini = TextStyle(
    color: ColorTheme.textMainColor,
    fontSize: SizeTheme.textMiniSize,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
    height: SizeTheme.textHeight,
  );
}
