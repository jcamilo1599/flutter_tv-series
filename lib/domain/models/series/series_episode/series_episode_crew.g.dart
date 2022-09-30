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
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String,
      character: json['character'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$SeriesEpisodeCrewModelToJson(
        SeriesEpisodeCrewModel instance) =>
    <String, dynamic>{
      'job': instance.job,
      'department': instance.department,
      'credit_id': instance.creditId,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'character': instance.character,
      'order': instance.order,
    };
