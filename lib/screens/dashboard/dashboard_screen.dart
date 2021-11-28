import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pos/configs/menu.dart';
import 'package:pos/models/menu_item.dart';
import 'package:pos/providers/business_details_provider.dart';
import 'package:pos/providers/cash_register_provider.dart';
import 'package:pos/providers/menu_provider.dart';
import 'package:pos/providers/profit_lost_provider.dart';
import 'package:pos/providers/user_provider.dart';
import 'package:pos/screens/dashboard/menu_screen.dart';
import 'package:pos/screens/dashboard/page_structure.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static List<MenuItem> mainMenu = Menu.mainMenu;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).fetchAndSetUser();
    Provider.of<BusinessDetailsProvider>(context, listen: false).fetchAndSetData();
    Provider.of<ProfitLostProvider>(context, listen: false).fetchAndSetData();    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<CashRegisterProvider>(context, listen: false).setAndFetchCashRegister(userId: 2, locationId: 1);
  }

  final _drawerController = ZoomDrawerController();

  final int _currentPage = 0;
  // final String _pageTitle = '';

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.Style1,
      menuScreen: MenuScreen(
        DashboardScreen.mainMenu,
        callback: _updatePage,
        current: _currentPage,
      ),
      mainScreen: const MainScreen(),
      borderRadius: 24.0,
      showShadow: true,
      angle: -1.0,
      mainScreenScale: .1,
      backgroundColor: Colors.grey.shade300,
      slideWidth: MediaQuery.of(context).size.width * .55,
      // clipMainScreen: false,
      openCurve: Curves.fastOutSlowIn,
      // closeCurve: Curves.bounceIn,
    );
  }

  void _updatePage(index) {
    // Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index);
    Provider.of<MenuProvider>(context, listen: false).updateCurrentPage(index, DashboardScreen.mainMenu[index].title, DashboardScreen.mainMenu[index].icon);
    _drawerController.toggle!();
  }

}

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier!,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: const PageStructure(),
        
        onHorizontalDragUpdate: (details) {
          if(details.delta.dx > 6) {
            ZoomDrawer.of(context)!.open();
          } else if(details.delta.dx < -6) {
            ZoomDrawer.of(context)!.close();
          }

        },
      ),
    );
  }
}