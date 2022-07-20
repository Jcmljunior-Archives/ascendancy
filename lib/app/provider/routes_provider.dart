import 'package:flutter/material.dart';

import '../view/initial_view.dart';
import '../view/preferences_view.dart';

class RoutesProvider with ChangeNotifier {
  String activePath = '/';

  Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) => const InitialView(),
    '/preferences': (BuildContext context) => const PreferencesView(),
  };

  // Define a rota em atividade.
  // Notifica as dependencias.
  void setActivePath(String activePath) {
    this.activePath = activePath;

    notifyListeners();
  }
}
