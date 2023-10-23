import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/theme/color_theme.dart';
import 'package:kumoh_school_bus/theme/size_theme.dart';
import 'package:kumoh_school_bus/theme/text_style_theme.dart';

class NavigationDrawer extends StatelessWidget {
  final NavigationDrawerController controller;

  const NavigationDrawer({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorTheme.backgroundMainColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            accountName: Text(
              controller.memberName,
              style: TextStyleTheme.textMainStyleMiddle,
            ),
            accountEmail: Text(
              controller.memberConnection,
              style: TextStyleTheme.textMainStyleSmall,
            ),
            decoration: const BoxDecoration(
              color: ColorTheme.itemMainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeTheme.borderRadiusSize),
                bottomRight: Radius.circular(SizeTheme.borderRadiusSize),
              ),
            ),
          ),
          ...controller.listTiles,
        ],
      ),
    );
  }
}

class NavigationDrawerController {
  final BuildContext context;
  final Map<String, Function(BuildContext)> items;
  final String memberName;
  final String memberConnection;
  late List<Widget> listTiles;

  late final Function() navigateToLoginView;

  NavigationDrawerController({
    required this.context,
    required this.memberName,
    required this.memberConnection,
    required this.items,
  }) {
    listTiles = items.keys
        .map((key) => ListTile(title: Text(key), onTap: () => items[key]!(context)))
        .toList();
    navigateToLoginView = () => items['logout']!(context);
  }
}
