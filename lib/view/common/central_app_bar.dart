import 'package:flutter/material.dart';
import '../../theme/themes.dart';

class CentralAppBar {
  const CentralAppBar({Key? key});

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
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: leading,
      actions: actions,
    );
  }
}
