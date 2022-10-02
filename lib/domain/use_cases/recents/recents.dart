import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../helpers/series.dart';
import '../../mappers/series/series.dart';
import '../../models/series/series/serie.dart';

class RecentsUseCase {
  RecentsUseCase();

  void addRecent(
    WidgetRef ref, {
    required SerieModel serie,
  }) {
    final String data = ref.read(sessionProvider.notifier).recents;
    final List<SerieModel> seriesList = SeriesMapper.list(data);
    final int serieIndex = SeriesHelper.getSerieIndex(seriesList, serie.id);

    if (serieIndex == -1) {
      // Añade la serie a favoritas
      seriesList.insert(0, serie);
    } else {
      // Elimina la serie de favoritas
      seriesList.removeAt(serieIndex);
    }

    // Guarda en el dispositivo las series favoritas
    ref.read(sessionProvider.notifier).recents = json.encode(seriesList);
  }

  List<SerieModel> getRecents(WidgetRef ref) {
    final String data = ref.read(sessionProvider.notifier).recents;
    final List<SerieModel> series = SeriesMapper.list(data);
    return series;
  }
}
