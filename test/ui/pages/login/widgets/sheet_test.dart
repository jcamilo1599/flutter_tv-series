import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/ui/pages/login/widgets/sheet.dart';

import '../../../../base.dart';

void main() {
  testWidgets('Pages - Login - LoginSheet', (WidgetTester tester) async {
    final Widget widget = BaseTest(
      home: LoginSheet(onDismiss: () {}),
    );

    await tester.pumpWidget(widget);
    await tester.tap(find.byType(IconButton));
  });
}
