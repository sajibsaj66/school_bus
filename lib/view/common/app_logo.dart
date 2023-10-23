import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_bus,
            color: ColorTheme.itemSubColor,
            size: 100.0,
          ),
          Text(
            "금오버스",
            style: TextStyleTheme.textMainStyleMiddle,
          ),
        ],
      ),
    );
  }
}
