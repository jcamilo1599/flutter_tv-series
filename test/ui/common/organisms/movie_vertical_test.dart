import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/ui/common/organisms/movie_vertical.dart';

import '../../../base.dart';
import '../../../data.dart';

void main() {
  testWidgets('Organisms - Movie Vertical', (WidgetTester tester) async {
    final Widget widget = BaseTest(home: OrgMovieV(serie: DataTest.serie));
    await mockNetworkImagesFor(() => tester.pumpWidget(widget));
    await tester.tap(find.byType(ElevatedButton));
    await tester.tap(find.byType(IconButton));
    expect(find.text(DataTest.serie.name ?? ''), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
  });
}
