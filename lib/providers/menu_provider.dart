import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;
  String _pageTitle = 'Beranda';
  IconData _icon = Icons.home;

  int get currentPage => _currentPage;
  String get pageTitle => _pageTitle;
  IconData? get titleIcon => _icon;

  void updateCurrentPage(int index, String pageTitle, IconData icon) {
    if (index != _currentPage) {
      _currentPage = index;
      _pageTitle = pageTitle;
      _icon = icon;
      notifyListeners();
    }
  }

  void updateTitle(String pageTitle, IconData? icon) {
    _pageTitle = pageTitle;
    _icon = icon!;
    notifyListeners();
  }
}
