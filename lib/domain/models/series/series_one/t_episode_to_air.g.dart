// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_episode_to_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TEpisodeToAirModel _$TEpisodeToAirModelFromJson(Map<String, dynamic> json) =>
    TEpisodeToAirModel(
      airDate: DateTime.parse(json['air_date'] as String),
      episodeNumber: json['episode_number'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String,
      runtime: json['runtime'] as int,
      seasonNumber: json['season_number'] as int,
      showId: json['show_id'] as int,
      stillPath: json['still_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$TEpisodeToAirModelToJson(TEpisodeToAirModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
