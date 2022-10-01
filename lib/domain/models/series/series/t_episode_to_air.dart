import 'package:json_annotation/json_annotation.dart';

part 't_episode_to_air.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TEpisodeToAirModel {
  final DateTime? airDate;
  final int? episodeNumber;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;

  TEpisodeToAirModel({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  factory TEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      _$TEpisodeToAirModelFromJson(json);

  Map<String, dynamic> toJson() => _$TEpisodeToAirModelToJson(this);
}
