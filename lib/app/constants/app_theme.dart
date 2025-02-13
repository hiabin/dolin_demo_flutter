import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelColor: AppColor.secondaryText,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      // indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentColor,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColor.primaryText),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5.h,
        titleTextStyle: const TextStyle(
          color: AppColor.primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        toolbarTextStyle: const TextStyle(
          color: AppColor.primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        )),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBackground,
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: Colors.black,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelColor: AppColor.secondaryText,
      unselectedLabelStyle: TextStyle(fontSize: 14),
      // indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
