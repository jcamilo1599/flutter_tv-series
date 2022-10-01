import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/ui/pages/login/login.dart';

import '../../../base.dart';

void main() {
  testWidgets('Pages - Login', (WidgetTester tester) async {
    const Widget widget = BaseTest(home: LoginPage());
    await mockNetworkImagesFor(() => tester.pumpWidget(widget));
    expect(find.text('Welcome!'), findsOneWidget);
  });
}
