// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_episode_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesEpisodeCrewModel _$SeriesEpisodeCrewModelFromJson(
        Map<String, dynamic> json) =>
    SeriesEpisodeCrewModel(
      job: json['job'] as String,
      department: json['department'] as String,
      creditId: json['creditId'] as String,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['knownForDepartment'] as String,
      name: json['name'] as String,
      originalName: json['originalName'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profilePath'] as String,
      character: json['character'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$SeriesEpisodeCrewModelToJson(
        SeriesEpisodeCrewModel instance) =>
    <String, dynamic>{
      'job': instance.job,
      'department': instance.department,
      'creditId': instance.creditId,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'knownForDepartment': instance.knownForDepartment,
      'name': instance.name,
      'originalName': instance.originalName,
      'popularity': instance.popularity,
      'profilePath': instance.profilePath,
      'character': instance.character,
      'order': instance.order,
    };
