import 'package:json_annotation/json_annotation.dart';

import 'series_episode_crew.dart';

part 'series_episode_api_resp.g.dart';

@JsonSerializable()
class SeriesEpisodeApiRespModel {
  final DateTime airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;
  final List<SeriesEpisodeCrewModel> crew;
  final List<SeriesEpisodeCrewModel> guestStars;
  final int? showId;

  SeriesEpisodeApiRespModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
    this.showId,
  });

  factory SeriesEpisodeApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesEpisodeApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesEpisodeApiRespModelToJson(this);
}
