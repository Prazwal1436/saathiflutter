import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme with Light Logo
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 121, 184, 14),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.black,
    extensions: <ThemeExtension<dynamic>>[
      AppThemeExtension(logoPath: "assets/images/logo_light.png"),
    ],
  );

  // Dark Theme with Dark Logo
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xffAAEF34),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.white,
    extensions: <ThemeExtension<dynamic>>[
      AppThemeExtension(logoPath: "assets/images/logo_dark.png"),
    ],
  );
}

// Theme extension for adding custom logo path
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final String logoPath;

  const AppThemeExtension({required this.logoPath});

  @override
  AppThemeExtension copyWith({String? logoPath}) {
    return AppThemeExtension(logoPath: logoPath ?? this.logoPath);
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    return this;
  }
}
