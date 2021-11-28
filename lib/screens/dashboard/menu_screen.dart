import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos/models/business_detail_model.dart';
import 'package:pos/models/menu_item.dart';
import 'package:pos/providers/business_details_provider.dart';
import 'package:pos/providers/menu_provider.dart';
import 'package:pos/utils/user_preferences.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> mainMenu;
  final Function(int)? callback;
  final int? current;

  const MenuScreen(
    this.mainMenu, {
    Key? key,
    this.callback,
    this.current,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final widthBox = const SizedBox(
    width: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    BusinessDetail businessData =
        Provider.of<BusinessDetailsProvider>(context).businessDetails;

    const TextStyle androidStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);

    const TextStyle iosStyle = TextStyle(color: Colors.white);
    
    final style = kIsWeb
        ? androidStyle
        : Platform.isAndroid
            ? androidStyle
            : iosStyle;

    void logout() async {
      UserPreferences().removeAuth();
      Navigator.of(context).pushReplacementNamed('auth');
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Theme.of(context).primaryColorDark,
              // Theme.of(context).colorScheme.secondary,
              Theme.of(context).primaryColorDark,
              Theme.of(context).colorScheme.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // BUSINESS IMAGE
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, bottom: 24.0, left: 24.0, right: 24.0),
                  child: Container(
                    width: 150,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      image: businessData.id < 1
                          ? const DecorationImage(
                              image: AssetImage('assets/images/APPTren-logo.png'))
                          : DecorationImage(
                              image: CachedNetworkImageProvider(
                                  businessData.logo)),
                    ),
                    // child: CachedNetworkImage(imageUrl: businessData.logo),
                  ),
                ),

                // BUSINESS NAME
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 36.0, left: 24.0, right: 24.0),
                  child: Text(
                    businessData.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                // MENU LIST
                Selector<MenuProvider, int>(
                  selector: (_, provider) => provider.currentPage,
                  builder: (_, index, __) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...widget.mainMenu
                          .map((item) => MenuItemWidget(
                                key: Key(item.index.toString()),
                                item: item,
                                callback: widget.callback,
                                widthBox: widthBox,
                                style: style,
                                selected: index == item.index,
                              ))
                          .toList()
                    ],
                  ),
                ),

                // LOGOUT BUTTON
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30, left: 24.0, right: 24.0),
                  child: OutlinedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "logout",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () => logout(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem? item;
  final Widget? widthBox;
  final TextStyle? style;
  final Function? callback;
  final bool? selected;

  final white = Colors.white;

  const MenuItemWidget({
    Key? key,
    this.item,
    this.widthBox,
    this.style,
    this.callback,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback!(item!.index),
      style: TextButton.styleFrom(
        primary: selected! ? const Color(0x44000000) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            item!.icon,
            color: white,
            size: 24,
          ),
          widthBox!,
          Expanded(
            child: Text(
              item!.title,
              style: style,
            ),
          )
        ],
      ),
    );
  }
}
