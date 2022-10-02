import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/ui/common/atoms/divider_vertical.dart';

import '../../../base.dart';

void main() {
  testWidgets('Atoms - DividerVertical', (WidgetTester tester) async {
    const Widget widget = BaseTest(home: AtomsDividerV());
    await tester.pumpWidget(widget);
  });
}
