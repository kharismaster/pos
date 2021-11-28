import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/configs/constants.dart';
import 'package:pos/providers/auth_provider.dart';
import 'package:pos/providers/business_details_provider.dart';
import 'package:pos/providers/cash_register_provider.dart';
import 'package:pos/providers/menu_provider.dart';
import 'package:pos/providers/products_provider.dart';
import 'package:pos/providers/profit_lost_provider.dart';
import 'package:pos/providers/user_provider.dart';
import 'package:pos/screens/dashboard/dashboard_screen.dart';
import 'package:pos/screens/on_boarding_screen.dart';
import 'package:pos/utils/user_preferences.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle(appName);
    setWindowMinSize(const Size(400, 750));
    setWindowMaxSize(Size.infinite);
  }

  // Cek Ulang untuk produksi. ini tidak aman
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<dynamic> getAuth() => UserPreferences().getAuth();

    return MultiProvider(
      providers: [
        // AUTH PROVIDER
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // MENU PROVIDER
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        // BUSINESS DETAILS PROVIDER
        ChangeNotifierProvider(create: (_) => BusinessDetailsProvider()),
        // PROFIT AND LOST PROVIDER
        ChangeNotifierProvider(create: (_) => ProfitLostProvider()),
        // CASH REGISTER PROVIDER
        ChangeNotifierProvider(create: (_) => CashRegisterProvider()),
        // PRODUCTS PROVIDER
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // scaffoldBackgroundColor: Pallete.scaffold,
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
        ),
        home: FutureBuilder(
          future: getAuth(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return const DashboardScreen();
                } else {
                  return const OnBoardingScreen();
                }
            }
          },
        ),
        routes: {
          // 'home': (ctx) => const HomeScreen(),
          'dashboard': (ctx) => const DashboardScreen(),
          'auth': (ctx) => const AuthScreen(),
          'welcome': (ctx) => const OnBoardingScreen(),
          // '/product': (context) => ProductScreen(),
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
