import 'package:json_annotation/json_annotation.dart';

import 'series_episode_crew.dart';

part 'series_episode_api_resp.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeriesEpisodeApiRespModel {
  final DateTime? airDate;
  final int? episodeNumber;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;
  final List<SeriesEpisodeCrewModel>? crew;
  final List<SeriesEpisodeCrewModel>? guestStars;
  final int? showId;
  final String? message;

  SeriesEpisodeApiRespModel({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
    this.showId,
    this.message,
  });

  factory SeriesEpisodeApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesEpisodeApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesEpisodeApiRespModelToJson(this);
}
