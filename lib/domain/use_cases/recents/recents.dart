import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../mappers/series/series.dart';
import '../../models/series/series/serie.dart';

class RecentsUseCase {
  RecentsUseCase();

  void addRecent(
    WidgetRef ref, {
    required SerieModel serie,
  }) {
    final String data = ref.read(sessionProvider.notifier).recents;
    final List<SerieModel> series = SeriesMapper.list(data);

    // Valida si la serie se encuentra como favorita
    final int serieIndex =
        series.indexWhere((SerieModel item) => item.id == serie.id);

    if (serieIndex == -1) {
      // Añade la serie a favoritas
      series.insert(0, serie);
    } else {
      // Elimina la serie de favoritas
      series.removeAt(serieIndex);
    }

    // Guarda en el dispositivo las series favoritas
    ref.read(sessionProvider.notifier).recents = json.encode(series);
  }

  List<SerieModel> getRecents(WidgetRef ref) {
    final String data = ref.read(sessionProvider.notifier).recents;
    final List<SerieModel> series = SeriesMapper.list(data);
    return series;
  }
}
