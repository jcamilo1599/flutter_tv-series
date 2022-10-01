import 'package:json_annotation/json_annotation.dart';

part 'series_episode_crew.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeriesEpisodeCrewModel {
  final String? job;
  final String? department;
  final String? creditId;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? character;
  final int? order;

  SeriesEpisodeCrewModel({
    this.job,
    this.department,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.character,
    this.order,
  });

  factory SeriesEpisodeCrewModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesEpisodeCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesEpisodeCrewModelToJson(this);
}
