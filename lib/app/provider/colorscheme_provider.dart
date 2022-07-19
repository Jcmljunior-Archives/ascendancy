import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum ColorsSchemes {
  native,
  light,
  dark,
}

class ColorSchemeProvider with ChangeNotifier {
  late ColorsSchemes colorScheme = ColorsSchemes.native;
  late Color accentColor = Colors.green;
  late ThemeData themeData;

  handleBrightness() {
    switch (colorScheme) {
      case ColorsSchemes.light:
        return Brightness.light;

      case ColorsSchemes.dark:
        return Brightness.dark;

      default:
        return SchedulerBinding.instance.window.platformBrightness;
    }
  }

  ThemeData updateThemes(ColorsSchemes colorScheme, Color accentColor) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: accentColor,
      brightness: handleBrightness(),
    );
  }

  setColorScheme(ColorsSchemes colorScheme) {
    this.colorScheme = colorScheme;
    themeData = updateThemes(colorScheme, accentColor);

    notifyListeners();
  }

  setAccentColor(Color accentColor) {
    this.accentColor = accentColor;
    themeData = updateThemes(colorScheme, accentColor);

    notifyListeners();
  }
}
