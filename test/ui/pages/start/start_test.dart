import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/domain/models/series/series/serie.dart';
import 'package:tv_series/domain/models/series/series/series_api_resp.dart';
import 'package:tv_series/ui/pages/start/start.dart';

import '../../../base.dart';
import '../../../data.dart';

void main() {
  Future<SeriesApiRespModel> getSeries() async {
    return SeriesApiRespModel(results: <SerieModel>[DataTest.serie]);
  }

  // StartPage
  final Widget widgetStart = StatefulBuilder(builder: (
    BuildContext context,
    StateSetter setState,
  ) {
    return BaseTest(home: StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return StartPage();
      },
    ));
  });

  testWidgets('Pages - StartPage', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(widgetStart);
      await tester.tap(find.byType(IconButton));
      await tester.tap(find.byType(BottomNavigationBar).first);
    });
  });

  testWidgets('Pages - StartPage & HomePage', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final Completer<SeriesApiRespModel> completer =
          Completer<SeriesApiRespModel>();

      await tester.pumpWidget(widgetStart);

      completer.complete(getSeries());
    });
  });
}
