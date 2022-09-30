// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_episode_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesEpisodeApiRespModel _$SeriesEpisodeApiRespModelFromJson(
        Map<String, dynamic> json) =>
    SeriesEpisodeApiRespModel(
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodeNumber: json['episode_number'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      productionCode: json['production_code'] as String?,
      runtime: json['runtime'] as int?,
      seasonNumber: json['season_number'] as int?,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      crew: (json['crew'] as List<dynamic>?)
          ?.map(
              (e) => SeriesEpisodeCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>?)
          ?.map(
              (e) => SeriesEpisodeCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      showId: json['show_id'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SeriesEpisodeApiRespModelToJson(
        SeriesEpisodeApiRespModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'crew': instance.crew,
      'guest_stars': instance.guestStars,
      'show_id': instance.showId,
      'message': instance.message,
    };
