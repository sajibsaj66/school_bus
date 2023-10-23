import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class TitledText extends StatelessWidget {
  final String title;
  final String text;
  final Color backgroundColor;

  const TitledText({
    Key? key,
    required this.title,
    required this.text,
    this.backgroundColor = ColorTheme.itemMainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: SizeTheme.paddingLargeSize,
            ),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyleTheme.textMainStyleMiddle,
            ),
          ),
          Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: SizeTheme.paddingLargeSize,
              ),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyleTheme.textDisableStyleMiddle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
