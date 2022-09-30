import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode? themeMode;

  void loadTheme() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    themeMode = brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
