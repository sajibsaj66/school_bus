import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:kumoh_school_bus/theme/themes.dart';
import 'package:kumoh_school_bus/view/common/navigation_drawer.dart';
import 'package:provider/provider.dart';

import 'central_app_bar.dart';

class DrawerAppBarScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final bool disableDrawer;
  final ImageProvider backgroundImage;

  const DrawerAppBarScaffold({
    Key? key,
    required this.appBarTitle,
    required this.body,
    required this.backgroundImage,
    this.disableDrawer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerAppBarScaffoldController>(
      create: (_) => DrawerAppBarScaffoldController(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CentralAppBar.build(
          context,
          title: appBarTitle,
          leading: disableDrawer ? null : Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: ColorTheme.itemSubColor,
                size: SizeTheme.iconMiddleSize,
              ),
            );
          }),
        ),
        drawer: disableDrawer ? null : Consumer<DrawerAppBarScaffoldController>(
          builder: (context, controller, child) => NavigationDrawer(
            controller: NavigationDrawerController(
              context: context,
              memberName: controller.memberName,
              memberConnection: controller.memberConnection,
              items: controller.drawerItems,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: backgroundImage, //AssetImage('assets/background.png'), // 배경 이미지
            ),
          ),
          child: body,
        ),
      ),
    );
  }
}

class DrawerAppBarScaffoldController extends ChangeNotifier {
  late String memberName;
  late String memberConnection;

  late Map<String, Function(BuildContext)> drawerItems;

  DrawerAppBarScaffoldController._privateConstructor();

  static final DrawerAppBarScaffoldController _instance =
      DrawerAppBarScaffoldController._privateConstructor();

  factory DrawerAppBarScaffoldController() {
    return _instance;
  }

  void changeMemberInfo(String memberName, String memberConnection) {
    this.memberName = memberName;
    this.memberConnection = memberConnection;
    notifyListeners();
  }

  void changeDrawerItems(Map<String, Function(BuildContext)> drawerItems) {
    this.drawerItems = drawerItems;
    notifyListeners();
  }

  @override
  void dispose() {
    // don't make it dispose when DrawerAppBarScaffold is disposed
  }
}
