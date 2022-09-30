// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesApiRespModel _$SeriesApiRespModelFromJson(Map<String, dynamic> json) =>
    SeriesApiRespModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SerieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SeriesApiRespModelToJson(SeriesApiRespModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'message': instance.message,
    };
