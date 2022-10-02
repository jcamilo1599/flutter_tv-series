import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/ui/common/atoms/no_image.dart';

import '../../../base.dart';

void main() {
  testWidgets('Atoms - NoImage', (WidgetTester tester) async {
    const Widget widget = BaseTest(home: AtomsNoImage());
    await tester.pumpWidget(widget);
  });
}
