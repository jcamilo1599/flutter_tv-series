import 'package:json_annotation/json_annotation.dart';

import 'serie.dart';

part 'series_api_resp.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeriesApiRespModel {
  final int? page;
  final List<SerieModel>? results;
  final int? totalPages;
  final int? totalResults;
  final String? message;

  SeriesApiRespModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.message,
  });

  factory SeriesApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesApiRespModelToJson(this);
}