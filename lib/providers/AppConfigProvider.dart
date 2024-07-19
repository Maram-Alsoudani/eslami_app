import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
// date
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    if (appTheme == themeMode) {
      return;
    }
    appTheme = themeMode;
    notifyListeners();
  }
}
