import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider/provider.dart';
import '../../../infrastructure/handlers/handlers.dart';

class LoginPage extends ConsumerWidget {
  static const String routeName = '/';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String token = ref.watch(sessionProvider).token;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                ref.read(sessionProvider.notifier).token = '123';

                Future<void>.delayed(const Duration(milliseconds: 100), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Handlers.getInitialRoute(),
                    (Route<dynamic> route) => false,
                  );
                });
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
