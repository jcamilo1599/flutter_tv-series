// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_episode_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesEpisodeApiRespModel _$SeriesEpisodeApiRespModelFromJson(
        Map<String, dynamic> json) =>
    SeriesEpisodeApiRespModel(
      airDate: DateTime.parse(json['airDate'] as String),
      episodeNumber: json['episodeNumber'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['productionCode'] as String,
      runtime: json['runtime'] as int,
      seasonNumber: json['seasonNumber'] as int,
      stillPath: json['stillPath'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
      crew: (json['crew'] as List<dynamic>)
          .map(
              (e) => SeriesEpisodeCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guestStars'] as List<dynamic>)
          .map(
              (e) => SeriesEpisodeCrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      showId: json['showId'] as int?,
    );

Map<String, dynamic> _$SeriesEpisodeApiRespModelToJson(
        SeriesEpisodeApiRespModel instance) =>
    <String, dynamic>{
      'airDate': instance.airDate.toIso8601String(),
      'episodeNumber': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'productionCode': instance.productionCode,
      'runtime': instance.runtime,
      'seasonNumber': instance.seasonNumber,
      'stillPath': instance.stillPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'crew': instance.crew,
      'guestStars': instance.guestStars,
      'showId': instance.showId,
    };
