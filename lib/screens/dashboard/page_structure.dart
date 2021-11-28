import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pos/providers/menu_provider.dart';
import 'package:pos/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class PageStructure extends StatelessWidget {
  final String? title;
  final Widget? child;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;

  const PageStructure({
    Key? key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.secondary;
    const angle = 0.0;
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    final _pageTitle = Provider.of<MenuProvider>(context).pageTitle;
    // final _pageIcon = Provider.of<MenuProvider>(context).titleIcon;
    final container = Container(
      alignment: Alignment.center,
      color: Colors.white,
      child:
          // Text("current: ${DashboardScreen.mainMenu[_currentPage].title}"),
          // Dashboard(),
          DashboardScreen.mainMenu[_currentPage].pageScreen,
    );

    return PlatformScaffold(
      backgroundColor: Colors.transparent,
      appBar: PlatformAppBar(
        // automaticallyImplyLeading: false,
        // material: (_, __) => MaterialAppBarData(elevation: elevation),
        title: Text(_pageTitle),
        leading: Transform.rotate(
          angle: angle,
          child: PlatformIconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
          ),
        ),
        trailingActions: actions,
      ),
      /* bottomNavBar: PlatformNavBar(
        material: (_, __) => MaterialNavBarData(
          selectedLabelStyle: TextStyle(color: color),
        ),
        currentIndex: _currentPage,
        itemChanged: (index) => Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index),
        items: DashboardScreen.mainMenu
            .map(
              (item) => BottomNavigationBarItem(
            label: item.title,
            icon: Icon(
              item.icon,
              color: color,
            ),
          ),
        )
            .toList(),
      ), */
      body: kIsWeb
          ? container
          : Platform.isAndroid
          ? container
          : SafeArea(
        child: container,
      ),
    );
  }
}