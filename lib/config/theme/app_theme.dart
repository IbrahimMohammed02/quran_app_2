import 'package:flutter/material.dart';
// import 'package:islami_c13_offline/core/resources/colors_manager.dart';

import '../../core/resources/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.gold,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: ColorsManager.white,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white)));
  static final ThemeData dark = ThemeData();
}
