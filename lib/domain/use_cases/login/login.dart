import 'package:flutter/material.dart';

import '../../../ui/pages/login/widgets/sheet.dart';

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
      builder: (_) => LoginSheet(onDismiss: onDismiss),
    );
  }
}
