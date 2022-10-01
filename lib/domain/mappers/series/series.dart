import 'dart:convert';

import '../../models/series/series/serie.dart';

class SeriesMapper {
  static List<SerieModel> list(String data) {
    final List<dynamic>? decode = json.decode(data) as List<dynamic>?;

    // Lista de series
    final List<SerieModel> series = decode
            ?.map((dynamic item) =>
                SerieModel.fromJson(item as Map<String, dynamic>))
            .toList() ??
        <SerieModel>[];

    return series;
  }
}
