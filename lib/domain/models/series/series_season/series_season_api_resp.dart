import 'package:json_annotation/json_annotation.dart';

import '../series_episode/series_episode_api_resp.dart';

part 'series_season_api_resp.g.dart';

@JsonSerializable()
class SeriesSeasonApiRespModel {
  final String id;
  final DateTime airDate;
  final List<SeriesEpisodeApiRespModel> episodes;
  final String name;
  final String overview;
  final int welcomeId;
  final String posterPath;
  final int seasonNumber;

  SeriesSeasonApiRespModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.welcomeId,
    required this.posterPath,
    required this.seasonNumber,
  });

  factory SeriesSeasonApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesSeasonApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesSeasonApiRespModelToJson(this);
}
