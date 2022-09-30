import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/ui/common/atoms/alert.dart';

import '../../../base.dart';

void main() {
  testWidgets('Atoms - Alert', (WidgetTester tester) async {
    const String title = 'title';
    const String description = 'description';
    const Widget widget = BaseTest(
      home: AtomAlert(
        title: title,
        description: description,
      ),
    );

    await tester.pumpWidget(widget);
    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.text('Cerrar'), findsOneWidget);
  });
}
