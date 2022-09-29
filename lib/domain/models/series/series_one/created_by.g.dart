// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedByModel _$CreatedByModelFromJson(Map<String, dynamic> json) =>
    CreatedByModel(
      id: json['id'] as int,
      creditId: json['creditId'] as String,
      name: json['name'] as String,
      gender: json['gender'] as int,
      profilePath: json['profilePath'] as String,
    );

Map<String, dynamic> _$CreatedByModelToJson(CreatedByModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creditId': instance.creditId,
      'name': instance.name,
      'gender': instance.gender,
      'profilePath': instance.profilePath,
    };
