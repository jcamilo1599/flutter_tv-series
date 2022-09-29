import 'package:json_annotation/json_annotation.dart';

part 't_episode_to_air.g.dart';

@JsonSerializable()
class TEpisodeToAirModel {
  final DateTime airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final int showId;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  TEpisodeToAirModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      _$TEpisodeToAirModelFromJson(json);

  Map<String, dynamic> toJson() => _$TEpisodeToAirModelToJson(this);
}
