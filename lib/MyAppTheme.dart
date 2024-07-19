import 'package:eslami_app/AppColors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  //light mode
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.white),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
              fontSize: 20,
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

  //dark mode
  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.dark_primary_color,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
          backgroundColor: Colors.transparent,
          elevation: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.yellow,
          unselectedItemColor: AppColors.white),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          )));
}
