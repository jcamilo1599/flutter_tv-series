import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/models/series/gateway/series_api_gateway.dart';
import '../../domain/models/series/series/serie.dart';
import '../../domain/models/series/series/series_api_resp.dart';
import '../../domain/models/series/series_episode/series_episode_api_resp.dart';
import '../../domain/models/series/series_season/series_season_api_resp.dart';
import '../../resources/environments/environments.dart';
import '../helpers/api_error.dart';

class SeriesApi extends SeriesApiGateway {
  @override
  Future<SeriesApiRespModel> getSeries() async {
    SeriesApiRespModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/popular?api_key=${Environments.apiKey}&language=es-CO&page=1');
      final http.Response httpResponse = await http.get(url);

      response = SeriesApiRespModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SeriesApiRespModel(message: apiError(error));
    }

    return response;
  }

  @override
  Future<SeriesApiRespModel> getTopRated() async {
    SeriesApiRespModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/top_rated?api_key=${Environments.apiKey}&language=es-CO&page=1');
      final http.Response httpResponse = await http.get(url);

      response = SeriesApiRespModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SeriesApiRespModel(message: apiError(error));
    }

    return response;
  }

  @override
  Future<SerieModel> getOne({required String idSerie}) async {
    SerieModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/$idSerie?api_key=${Environments.apiKey}&language=es-CO');
      final http.Response httpResponse = await http.get(url);

      response = SerieModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SerieModel(message: apiError(error));
    }

    return response;
  }

  @override
  Future<SeriesSeasonApiRespModel> getSeason({
    required String idSerie,
    required String idSeason,
  }) async {
    SeriesSeasonApiRespModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/$idSerie/season/$idSeason?api_key=${Environments.apiKey}&language=es-CO');
      final http.Response httpResponse = await http.get(url);

      response = SeriesSeasonApiRespModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SeriesSeasonApiRespModel(message: apiError(error));
    }

    return response;
  }

  @override
  Future<SeriesEpisodeApiRespModel> getEpisode({
    required String idSerie,
    required String idSeason,
    required String episode,
  }) async {
    SeriesEpisodeApiRespModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/$idSerie/season/$idSeason/episode/$episode?api_key=${Environments.apiKey}&language=es-CO');
      final http.Response httpResponse = await http.get(url);

      response = SeriesEpisodeApiRespModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SeriesEpisodeApiRespModel(message: apiError(error));
    }

    return response;
  }

  @override
  Future<SeriesApiRespModel> getAiringToday() async {
    SeriesApiRespModel response;

    try {
      final Uri url = Uri.parse(
          '${Environments.movieDB}/tv/airing_today?api_key=${Environments.apiKey}&language=es-CO');
      final http.Response httpResponse = await http.get(url);

      response = SeriesApiRespModel.fromJson(
        json.decode(utf8.decode(httpResponse.bodyBytes)),
      );
    } on Exception catch (error) {
      response = SeriesApiRespModel(message: apiError(error));
    }

    return response;
  }
}
