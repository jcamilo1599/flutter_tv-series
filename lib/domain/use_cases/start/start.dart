import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../../infrastructure/handlers/handlers.dart';

class StartUseCase {
  StartUseCase();

  void closeSession(BuildContext context, WidgetRef ref) {
    ref.read(sessionProvider.notifier).token = '';

    Future<void>.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Handlers.getInitialRoute(),
        (Route<dynamic> route) => false,
      );
    });
  }
}
