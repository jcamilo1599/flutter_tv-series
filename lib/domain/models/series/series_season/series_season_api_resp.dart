import 'package:json_annotation/json_annotation.dart';

import '../series_episode/series_episode_api_resp.dart';

part 'series_season_api_resp.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeriesSeasonApiRespModel {
  final int? id;
  final DateTime? airDate;
  final List<SeriesEpisodeApiRespModel>? episodes;
  final String? name;
  final String? overview;
  final int? welcomeId;
  final String? posterPath;
  final int? seasonNumber;
  final String? message;

  SeriesSeasonApiRespModel({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.welcomeId,
    this.posterPath,
    this.seasonNumber,
    this.message,
  });

  factory SeriesSeasonApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesSeasonApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesSeasonApiRespModelToJson(this);
}
