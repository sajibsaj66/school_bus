import 'package:flutter/cupertino.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class TitledOutlinedContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const TitledOutlinedContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Column(
        children: [
          Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: ColorTheme.itemMainColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(SizeTheme.borderRadiusSize),
              ),
              border: Border.all(color: ColorTheme.itemSubColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SizeTheme.paddingMiddleSize,
                horizontal: SizeTheme.paddingLargeSize,
              ),
              child: Text(
                title,
                style: TextStyleTheme.textMainStyleMiddle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: ColorTheme.backgroundMainColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(SizeTheme.borderRadiusSize),
              ),
              border: Border.all(color: ColorTheme.itemSubColor),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
