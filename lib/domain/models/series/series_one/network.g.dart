// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkModel _$NetworkModelFromJson(Map<String, dynamic> json) => NetworkModel(
      id: json['id'] as int,
      name: json['name'] as String,
      logoPath: json['logoPath'] as String,
      originCountry: json['originCountry'] as String,
    );

Map<String, dynamic> _$NetworkModelToJson(NetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoPath': instance.logoPath,
      'originCountry': instance.originCountry,
    };
