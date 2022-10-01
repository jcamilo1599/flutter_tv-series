import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/provider.dart';
import '../../../ui/common/atoms/alert.dart';
import '../../../ui/pages/serie/serie.dart';
import '../../models/series/gateway/series_api_gateway.dart';
import '../../models/series/series/serie.dart';
import '../../models/series/series/series_api_resp.dart';
import '../../models/series/series_episode/series_episode_api_resp.dart';
import '../../models/series/series_season/series_season_api_resp.dart';

class SeriesUseCase {
  final SeriesApiGateway _gateway;

  SeriesUseCase(this._gateway);

  Future<SeriesApiRespModel> getSeries(WidgetRef ref) async {
    final SeriesApiRespModel series = await _gateway.getSeries();

    // Guarda en el dispositivo las peliculas populares
    ref.read(sessionProvider.notifier).popular = json.encode(series);

    return series;
  }

  Future<SeriesApiRespModel> getTopRated() async {
    return Future<SeriesApiRespModel>.delayed(
      const Duration(milliseconds: 2000),
      _gateway.getTopRated,
    );
  }

  Future<SerieModel?> getOne(
    BuildContext context, {
    required String idSerie,
  }) async {
    final SerieModel respApi =
        await _gateway.getOne(idSerie: idSerie);

    if (respApi.message == null) {
      return respApi;
    }

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => AtomAlert(
        title: 'Upps...',
        description: respApi.message!,
      ),
    );

    return null;
  }

  Future<SeriesSeasonApiRespModel?> getSeason(
    BuildContext context, {
    required String idSerie,
    required String idSeason,
  }) async {
    final SeriesSeasonApiRespModel respApi =
        await _gateway.getSeason(idSerie: idSerie, idSeason: idSeason);

    if (respApi.message == null) {
      return respApi;
    }

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => AtomAlert(
        title: 'Upps...',
        description: respApi.message!,
      ),
    );

    return null;
  }

  Future<SeriesEpisodeApiRespModel> getEpisode({
    required String idSerie,
    required String idSeason,
    required String episode,
  }) async {
    return _gateway.getEpisode(
      idSerie: idSerie,
      idSeason: idSeason,
      episode: episode,
    );
  }

  Future<SeriesApiRespModel> getAiringToday() async {
    return _gateway.getAiringToday();
  }

  void alertError(BuildContext context, String? message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AtomAlert(
        title: 'Upps...',
        description: message ?? 'Se produjo un error inesperado.',
      ),
    );
  }

  void serieDetail(
    BuildContext context, {
    required int index,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => SeriePage(index: index)),
    );
  }

  SeriesApiRespModel serieToJson(String data) {
    return SeriesApiRespModel.fromJson(json.decode(data));
  }
}
