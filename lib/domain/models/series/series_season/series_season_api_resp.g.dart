// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_season_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesSeasonApiRespModel _$SeriesSeasonApiRespModelFromJson(
        Map<String, dynamic> json) =>
    SeriesSeasonApiRespModel(
      id: json['id'] as String,
      airDate: DateTime.parse(json['airDate'] as String),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) =>
              SeriesEpisodeApiRespModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      welcomeId: json['welcomeId'] as int,
      posterPath: json['posterPath'] as String,
      seasonNumber: json['seasonNumber'] as int,
    );

Map<String, dynamic> _$SeriesSeasonApiRespModelToJson(
        SeriesSeasonApiRespModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'airDate': instance.airDate.toIso8601String(),
      'episodes': instance.episodes,
      'name': instance.name,
      'overview': instance.overview,
      'welcomeId': instance.welcomeId,
      'posterPath': instance.posterPath,
      'seasonNumber': instance.seasonNumber,
    };
