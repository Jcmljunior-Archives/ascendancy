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

  Brightness handleBrightness() {
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

  // Define um novo padrão de cor.
  // Atualiza o estado do tema ativo.
  // Notifica as dependencias.
  setColorScheme(ColorsSchemes colorScheme) {
    this.colorScheme = colorScheme;
    themeData = updateThemes(colorScheme, accentColor);

    notifyListeners();
  }

  // Define a cor de destaque.
  // Atualiza o estado do tema ativo.
  // Notifica as dependencias.
  setAccentColor(Color accentColor) {
    this.accentColor = accentColor;
    themeData = updateThemes(colorScheme, accentColor);

    notifyListeners();
  }
}
