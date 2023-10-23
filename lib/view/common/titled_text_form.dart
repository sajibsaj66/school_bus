import 'package:flutter/material.dart';
import '../../theme/themes.dart';

class TitledTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  final IconData? prefixIcon;

  final TextInputType keyboardType;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TitledTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        Container(
          decoration: BoxDecoration(
            color: ColorTheme.backgroundSubColor,
            borderRadius: BorderRadius.circular(SizeTheme.borderRadiusSize),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: SizeTheme.paddingLargeSize,
            ),
            child: TextFormField(
              controller: controller,
              validator: validator,
              cursorColor: ColorTheme.backgroundSubColor,
              keyboardType: keyboardType,
              obscureText: keyboardType == TextInputType.visiblePassword,
              style: TextStyleTheme.textMainStyleMiddle,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: TextStyleTheme.textDisableStyleMiddle,
                fillColor: ColorTheme.backgroundSubColor,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
