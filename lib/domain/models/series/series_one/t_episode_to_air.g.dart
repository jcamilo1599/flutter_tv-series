// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_episode_to_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TEpisodeToAirModel _$TEpisodeToAirModelFromJson(Map<String, dynamic> json) =>
    TEpisodeToAirModel(
      airDate: DateTime.parse(json['airDate'] as String),
      episodeNumber: json['episodeNumber'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['productionCode'] as String,
      runtime: json['runtime'] as int,
      seasonNumber: json['seasonNumber'] as int,
      showId: json['showId'] as int,
      stillPath: json['stillPath'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$TEpisodeToAirModelToJson(TEpisodeToAirModel instance) =>
    <String, dynamic>{
      'airDate': instance.airDate.toIso8601String(),
      'episodeNumber': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'productionCode': instance.productionCode,
      'runtime': instance.runtime,
      'seasonNumber': instance.seasonNumber,
      'showId': instance.showId,
      'stillPath': instance.stillPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
