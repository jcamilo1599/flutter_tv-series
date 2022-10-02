import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../../infrastructure/handlers/handlers.dart';
import '../../../ui/common/atoms/alert.dart';
import '../../../ui/pages/login/widgets/body.dart';
import '../../../ui/pages/login/widgets/sheet.dart';
import '../../models/login/login.dart';

class LoginUseCase {
  LoginUseCase();

  Future<void> sheetLogin(
    BuildContext context, {
    required Null Function() onDismiss,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      enableDrag: false,
      isDismissible: false,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => LoginSheet(onDismiss: onDismiss),
    );
  }

  Future<void> login(
    WidgetRef ref,
    BuildContext context, {
    required LoginModel loginData,
  }) async {
    Future<void>.delayed(const Duration(milliseconds: 1200), () {
      if (loginData.name == 'maria' && loginData.pass == 'password' ||
          loginData.name == 'pedro' && loginData.pass == '123456') {
        ref.read(sessionProvider.notifier).token = '123';
        ref.read(sessionProvider.notifier).user = loginData.name;
        ref.read(LoginBody.buttonsProvider.state).state = true;

        Future<void>.delayed(const Duration(milliseconds: 100), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Handlers.getInitialRoute(),
            (Route<dynamic> route) => false,
          );
        });
      } else {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => const AtomAlert(
            title: 'Upps...',
            description: 'Email o contraseña incorrecta',
          ),
        );
      }

      ref.read(LoginSheet.loadingProvider.state).state = false;
    });
  }
}
