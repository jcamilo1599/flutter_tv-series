// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesApiRespModel _$SeriesApiRespModelFromJson(Map<String, dynamic> json) =>
    SeriesApiRespModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              SeriesResultApiRespModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int,
      totalResults: json['totalResults'] as int,
    );

Map<String, dynamic> _$SeriesApiRespModelToJson(SeriesApiRespModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };