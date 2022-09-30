import 'package:json_annotation/json_annotation.dart';

part 'serie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SerieModel {
  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  SerieModel({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory SerieModel.fromJson(Map<String, dynamic> json) =>
      _$SerieModelFromJson(json);

  Map<String, dynamic> toJson() => _$SerieModelToJson(this);
}
