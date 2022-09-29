import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider/provider.dart';
import '../../../infrastructure/handlers/handlers.dart';

class HomePage extends ConsumerWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ref.read(sessionProvider.notifier).token = '';

                Future<void>.delayed(const Duration(milliseconds: 100), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Handlers.getInitialRoute(),
                    (Route<dynamic> route) => false,
                  );
                });
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
