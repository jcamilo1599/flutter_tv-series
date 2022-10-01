import '../series/serie.dart';
import '../series/series_api_resp.dart';
import '../series_episode/series_episode_api_resp.dart';
import '../series_season/series_season_api_resp.dart';

abstract class SeriesApiGateway {
  Future<SeriesApiRespModel> getSeries();

  Future<SeriesApiRespModel> getTopRated();

  Future<SerieModel> getOne({required String idSerie});

  Future<SeriesSeasonApiRespModel> getSeason({
    required String idSerie,
    required String idSeason,
  });

  Future<SeriesEpisodeApiRespModel> getEpisode({
    required String idSerie,
    required String idSeason,
    required String episode,
  });

  Future<SeriesApiRespModel> getAiringToday();
}
