// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_season_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesSeasonApiRespModel _$SeriesSeasonApiRespModelFromJson(
        Map<String, dynamic> json) =>
    SeriesSeasonApiRespModel(
      id: json['id'] as String?,
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) =>
              SeriesEpisodeApiRespModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      welcomeId: json['welcome_id'] as int?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SeriesSeasonApiRespModelToJson(
        SeriesSeasonApiRespModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'air_date': instance.airDate?.toIso8601String(),
      'episodes': instance.episodes,
      'name': instance.name,
      'overview': instance.overview,
      'welcome_id': instance.welcomeId,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'message': instance.message,
    };
