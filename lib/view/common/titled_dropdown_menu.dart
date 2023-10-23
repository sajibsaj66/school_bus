import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/themes.dart';

import 'outlined_dropdown_menu.dart';

class TitledDropdownMenu<T> extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final T value;
  final List<T> items;
  final void Function(dynamic) onChanged;
  final bool isExpanded;

  const TitledDropdownMenu({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.isExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SizeTheme.paddingMiddleSize,
              horizontal: SizeTheme.paddingLargeSize,
            ),
            child: Row(
              children: [
                Icon(
                  prefixIcon,
                  size: SizeTheme.iconMiddleSize,
                  color: ColorTheme.itemSubColor,
                ),
                const SizedBox(
                  width: SizeTheme.paddingMiddleSize,
                ),
                Text(
                  labelText ?? "",
                  style: TextStyleTheme.textMainStyleSmall,
                ),
              ],
            ),
          ),
          OutlinedDropdownMenu(
            value: value,
            items: items,
            onChanged: onChanged,
            isExpanded: isExpanded,
            verticalPadding: 0.0,
            horizontalPadding: SizeTheme.paddingLargeSize,
          )
        ],
      ),
    );
  }
}
