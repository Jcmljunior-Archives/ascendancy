import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/routes_provider.dart';

class AppBarComponent extends StatelessWidget {
  final String title;

  const AppBarComponent({
    required this.title,
    super.key,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: context.watch<RoutesProvider>().activePath != '/'
          ? IconButton(
              splashRadius: 26,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                context.read<RoutesProvider>().setActivePath('/');
              },
            )
          : const SizedBox(),
      title: Text(title),
      centerTitle: true,
      actions: context.read<RoutesProvider>().activePath == '/'
          ? <Widget>[
              TextButton(
                onPressed: () {
                  context.read<RoutesProvider>().setActivePath('/preferences');
                  Navigator.pushNamed(context, '/preferences');
                },
                child: const Text('Preferencias'),
              ),
            ]
          : <Widget>[],
    );
  }
}
