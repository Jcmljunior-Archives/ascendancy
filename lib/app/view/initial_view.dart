import 'package:ascendancy/app/provider/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<RoutesProvider>().activePath),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<RoutesProvider>().pathFor(context, '/');
            },
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              context.read<RoutesProvider>().pathFor(context, '/preferences');
            },
            child: const Text('Preferences'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Você pressionou esse botão tantas vezes:'),
              Text(
                '${context.watch<CountProvider>().count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  context.read<CountProvider>().increment();
                },
                child: const Text('Incrementar'),
              ),
              const SizedBox(
                width: 6,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CountProvider>().decrement();
                },
                child: const Text('Decrementar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
