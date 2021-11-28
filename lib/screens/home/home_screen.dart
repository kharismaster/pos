import 'package:flutter/material.dart';
import 'package:pos/configs/menu.dart';
import 'package:pos/models/menu_item.dart';
import 'package:pos/models/user_model.dart';
import 'package:pos/providers/menu_provider.dart';
import 'package:pos/providers/user_provider.dart';
import 'package:pos/screens/dashboard/dashboard_screen.dart';
import 'package:pos/screens/dashboard/menu_screen.dart';
import 'package:pos/utils/responsive.dart';
import 'package:pos/widgets/custom_app_bar.dart';
import 'package:pos/widgets/custom_tab_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MenuItem> _tabMenu = Menu.mainTabBarMenu;
  final List<Widget> _tabScreen = Menu.mainTabScreen;
  final List<IconData> _tabMenuIcon = Menu.iconsTabMenu;

  int _selectedIndex = 0;

  final int _currentPage = 0;
  // final String _pageTitle = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    User currentUser = Provider.of<UserProvider>(context).currentUser;
    
    return DefaultTabController(
      length: _tabMenuIcon.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _tabMenuIcon,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,

        //body:
        // select tab on tab icon only
        // body: _screens[_selectedIndex],

        // select tab with tab icon and slide right left
        // body: TabBarView(
        //   // physics: NeverScrollableScrollPhysics(),
        //   children: _screens,
        // ),

        // select tab n keep story
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: MenuScreen(
                  DashboardScreen.mainMenu,
                  callback: _updatePage,
                  current: _currentPage,
                ),
              ),
            Expanded(
              flex: 5,
              child: IndexedStack(
                index: _selectedIndex,
                children: _tabScreen,
              ),
            ),
          ],
        ),

        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: CustomTabBar(
                  icons: _tabMenuIcon,
                  selectedIndex: _selectedIndex,
                  // onTap: (index) => setState(() => _selectedIndex = index),
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Provider.of<MenuProvider>(context, listen: false)
                        .updateTitle(
                            _tabMenu[index].title, _tabMenuIcon[index]);
                  },
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  void _updatePage(index) {
    // Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index, DashboardScreen.mainMenu[index].title, DashboardScreen.mainMenu[index].icon);
    // _drawerController.toggle!();
  }

}
