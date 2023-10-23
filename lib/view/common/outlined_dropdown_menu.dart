import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/view/common/commons.dart';

import '../../theme/themes.dart';

class OutlinedDropdownMenu<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final void Function(dynamic) onChanged;
  final bool isExpanded;
  final double verticalPadding;
  final double horizontalPadding;

  const OutlinedDropdownMenu({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.isExpanded,
    this.verticalPadding = SizeTheme.paddingMiddleSize,
    this.horizontalPadding = SizeTheme.paddingLargeSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.backgroundSubColor,
        borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: VanillaDropdownMenu(
          value: value,
          items: items,
          onChanged: onChanged,
          isExpanded: isExpanded,
        ),
      ),
    );
  }
}
