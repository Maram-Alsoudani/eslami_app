import 'package:eslami_app/AppColors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.light_primary_color,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
          backgroundColor: Colors.transparent,
          elevation: 0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.white),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          )));
}
