import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

class ScrollableContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const ScrollableContainer(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700, minHeight: 700),
        color: Color(0xccffffff),//color,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(SizeTheme.paddingLargeSize),
              child: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
