import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIndex = prefs.getInt('themeMode') ?? ThemeMode.system.index;
    ThemeMode loadedTheme = ThemeMode.values[themeIndex];

    if (_themeMode != loadedTheme) {
      _themeMode = loadedTheme;
      notifyListeners(); // Only notify if there's a change
    }
  }

  void toggleTheme(ThemeMode mode) async {
    if (_themeMode != mode) {
      // Prevent unnecessary rebuilds
      _themeMode = mode;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('themeMode', mode.index);
    }
  }
}
