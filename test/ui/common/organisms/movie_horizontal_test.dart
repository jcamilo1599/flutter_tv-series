import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/ui/common/organisms/movie_horizontal.dart';

import '../../../base.dart';
import '../../../data.dart';

void main() {
  testWidgets('Organisms - Movie Horizontal', (WidgetTester tester) async {
    final Widget widget = BaseTest(
      home: OrgMovieH(
        serie: DataTest.serie,
        onTap: () {},
      ),
    );

    await mockNetworkImagesFor(() => tester.pumpWidget(widget));
    expect(find.text(DataTest.serie.name ?? ''), findsOneWidget);
  });
}
