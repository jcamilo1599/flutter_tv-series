import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/ui/common/molecules/stars.dart';

import '../../../base.dart';

void main() {
  testWidgets('Molecules - Stars', (WidgetTester tester) async {
    const Widget widget = BaseTest(home: MoleculesStars(stars: 3.5));
    await tester.pumpWidget(widget);
    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_half), findsNWidgets(1));
    expect(find.byIcon(Icons.star_border_sharp), findsNWidgets(1));
  });
}
