import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';


class VanillaAppBar {
  const VanillaAppBar({Key? key});

  static AppBar build(
      BuildContext context, {
        required String title,
        Widget? leading,
        List<Widget>? actions,
      }) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyleTheme.textMainStyleLarge,
      ),
      backgroundColor: ColorTheme.backgroundMainColor,
      elevation: 0.0,
      leading: leading,
      actions: actions,
    );
  }
}
