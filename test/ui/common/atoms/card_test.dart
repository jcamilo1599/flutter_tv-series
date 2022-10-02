import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/ui/common/molecules/card.dart';

void main() {
  testWidgets('Atoms - Card', (WidgetTester tester) async {
    const String poster = '/tYJpx8SQRDZtqFYu9MZ6RtktPAe.jpg';
    const Widget widget = AtomCard(poster: poster);
    await mockNetworkImagesFor(() => tester.pumpWidget(widget));
  });
}
