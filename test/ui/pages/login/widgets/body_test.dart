import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/ui/pages/login/widgets/body.dart';

import '../../../../base.dart';

void main() {
  testWidgets('Pages - Login - LoginBody', (WidgetTester tester) async {
    final Widget widget = BaseTest(home: LoginBody());
    await mockNetworkImagesFor(() => tester.pumpWidget(widget));
    await tester.tap(find.text('Forgot password?'));
    await tester.tap(find.text('Sign up'));
    await tester.tap(find.text('Log in'));
    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });
}
