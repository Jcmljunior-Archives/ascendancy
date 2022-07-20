import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
import '../component/appbar_component.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
        title: 'Home Page',
      ).build(context),
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
              ElevatedButton.icon(
                onPressed: () {
                  context.read<CountProvider>().increment();
                },
                icon: const Icon(Icons.add),
                label: const Text('Incrementar'),
              ),
              const SizedBox(
                width: 6,
              ),
              ElevatedButton.icon(
                onPressed: context.watch<CountProvider>().count > 0
                    ? () {
                        context.read<CountProvider>().decrement();
                      }
                    : null,
                icon: const Icon(Icons.remove),
                label: const Text('Decrementar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
