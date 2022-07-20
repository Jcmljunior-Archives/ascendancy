import 'package:ascendancy/app/provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/provider/count_provider.dart';
import 'app/provider/colorscheme_provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ColorSchemeProvider()),
        ChangeNotifierProvider(create: (_) => RoutesProvider()),
      ],
      child: const Bootstrap(),
    ),
  );
}

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning App',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ColorSchemeProvider>().updateThemes(
            context.read<ColorSchemeProvider>().colorScheme,
            context.read<ColorSchemeProvider>().accentColor,
          ),
      initialRoute: '/',
      routes: context.read<RoutesProvider>().routes,
    );
  }
}
