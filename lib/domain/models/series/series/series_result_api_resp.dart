import 'package:json_annotation/json_annotation.dart';

part 'series_result_api_resp.g.dart';

@JsonSerializable()
class SeriesResultApiRespModel {
  final String backdropPath;
  final DateTime firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  SeriesResultApiRespModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SeriesResultApiRespModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesResultApiRespModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResultApiRespModelToJson(this);
}
