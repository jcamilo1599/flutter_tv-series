import 'package:json_annotation/json_annotation.dart';

import 'series_result_api_resp.dart';

part 'series_api_resp.g.dart';

@JsonSerializable()
class SeriesApiRespModel {
  final int page;
  final List<SeriesResultApiRespModel> results;
  final int totalPages;
  final int totalResults;

  SeriesApiRespModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SeriesApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesApiRespModelToJson(this);
}