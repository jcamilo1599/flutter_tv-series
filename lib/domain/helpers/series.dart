import '../models/series/series/serie.dart';

class SeriesHelper {
  static int getSerieIndex(List<SerieModel> series, int? id) {
    return series.indexWhere((SerieModel item) => item.id == id);
  }
}
