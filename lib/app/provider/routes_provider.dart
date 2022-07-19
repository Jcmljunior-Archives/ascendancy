import 'package:ascendancy/app/view/preferences_view.dart';
import 'package:flutter/material.dart';

import '../view/initial_view.dart';

class RoutesProvider with ChangeNotifier {
  String activePath = '/';

  Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) => const InitialView(),
    '/preferences': (BuildContext context) => const PreferencesView(),
  };

  pathFor(BuildContext context, String path) {
    if (routes.containsKey(path)) {
      activePath = path;
      Navigator.pushNamed(context, path);
    }
  }
}
