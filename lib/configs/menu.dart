import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/models/menu_item.dart';
import 'package:pos/screens/auth/auth_screen.dart';
import 'package:pos/screens/home/home_screen.dart';
import 'package:pos/screens/home/over_view_screen.dart';
import 'package:pos/screens/order/order_screen.dart';
import 'package:pos/screens/pos/pos_screen.dart';
import 'package:pos/screens/product/products_screen.dart';
import 'package:pos/screens/sales/sales_screen.dart';
import 'package:pos/screens/table/table_screen.dart';
import 'package:pos/screens/empty_screen.dart';


class Menu {
  static List<MenuItem> mainMenu = [
      const MenuItem('Beranda', Icons.home, 0, HomeScreen()),
      const MenuItem('Kontak', Icons.payment, 1, AuthScreen()),
      const MenuItem('Produk', Icons.card_giftcard, 2, EmptyScreen()),
      const MenuItem('Pembelian', Icons.notifications, 3, AuthScreen()),
      const MenuItem('Penjualan', Icons.help, 4, EmptyScreen()),
      const MenuItem('Transfer Stok', Icons.info_outline, 5, AuthScreen()),
      const MenuItem('Biaya', Icons.settings, 6, EmptyScreen()),
      const MenuItem('Laporan', Icons.error, 7, EmptyScreen()),
      const MenuItem('Pengaturan', Icons.settings, 8, EmptyScreen()),
      const MenuItem('Tentang Kami', Icons.error, 9, EmptyScreen()),
    ];

  static List<MenuItem> mainTabBarMenu = [
    const MenuItem('Beranda', Icons.home, 0, OverViewScreen()),
      const MenuItem('Produk', Icons.payment, 1, ProductsScreen()),
      const MenuItem('Layar Pos', Icons.card_giftcard, 2, PosScreen()),
      const MenuItem('Meja', Icons.notifications, 3, TableScreen()),
      const MenuItem('Penjualan', Icons.help, 4, SalesScreen()),
      const MenuItem('Pesanan', Icons.info_outline, 5, OrderScreen()),
  ];

  static List<Widget> mainTabScreen = [
    const OverViewScreen(),
    const ProductsScreen(),
    // const Facebook(),
    const PosScreen(),
    const TableScreen(),
    const SalesScreen(),
    const OrderScreen(),
  ];

  static List<IconData> iconsTabMenu = [
    MdiIcons.home,
    MdiIcons.archiveCheck,
    MdiIcons.storefront,
    MdiIcons.viewGridPlus,
    MdiIcons.microsoftExcel,
    MdiIcons.monitorEdit,
  ];

}