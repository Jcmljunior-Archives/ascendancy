import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/colorscheme_provider.dart';
import '../provider/routes_provider.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  Widget preferencesListHeading(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget preferencesListItem(
      String title, String subtitle, void Function()? callableFunction) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      onTap: callableFunction,
    );
  }

  preferencesListItemGenerateSubtitleForTheme(ColorsSchemes subtitle) {
    switch (subtitle) {
      case ColorsSchemes.light:
        return 'Modo claro';

      case ColorsSchemes.dark:
        return 'Modo escuro';

      default:
        return 'Seguir o sistema';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<RoutesProvider>().activePath),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            preferencesListHeading('Geral'),
            preferencesListItem(
              'Tema',
              '${preferencesListItemGenerateSubtitleForTheme(context.watch<ColorSchemeProvider>().colorScheme)}',
              () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: const Text('Configurar tema:'),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Modo claro'),
                        leading: Radio<ColorsSchemes>(
                          value: ColorsSchemes.light,
                          groupValue:
                              context.watch<ColorSchemeProvider>().colorScheme,
                          onChanged: (ColorsSchemes? colorScheme) {
                            context
                                .read<ColorSchemeProvider>()
                                .setColorScheme(colorScheme!);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Modo escuro'),
                        leading: Radio<ColorsSchemes>(
                          value: ColorsSchemes.dark,
                          groupValue:
                              context.watch<ColorSchemeProvider>().colorScheme,
                          onChanged: (ColorsSchemes? colorScheme) {
                            context
                                .read<ColorSchemeProvider>()
                                .setColorScheme(colorScheme!);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Seguir o sistema'),
                        leading: Radio<ColorsSchemes>(
                          value: ColorsSchemes.native,
                          groupValue:
                              context.watch<ColorSchemeProvider>().colorScheme,
                          onChanged: (ColorsSchemes? colorScheme) {
                            context
                                .read<ColorSchemeProvider>()
                                .setColorScheme(colorScheme!);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            preferencesListItem('Idioma', 'Seguir o sistema', () {}),
            preferencesListItem('Esquema de cores', 'Verde', () {}),
            preferencesListHeading('Notificações'),
            preferencesListItem('Configurar notificações push', '', () {}),
          ],
        ),
      ),
    );
  }
}
