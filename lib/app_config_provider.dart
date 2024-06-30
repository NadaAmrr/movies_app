
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLang = 'ar';
  ThemeMode appTheme = ThemeMode.light;

  /// Lang
  void changeLang(String lang) {
    if (appLang == lang) {
      return;
    }
    appLang = lang;
    notifyListeners();
  }

  /// theme
  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isEng() {
    return appLang == "en";
  }

  /// Light
  bool isLightMode() {
    return appTheme == ThemeMode.light;
  }

  /// Dark
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
