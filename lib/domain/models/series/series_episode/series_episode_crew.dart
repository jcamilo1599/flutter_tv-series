import 'package:json_annotation/json_annotation.dart';

part 'series_episode_crew.g.dart';

@JsonSerializable()
class SeriesEpisodeCrewModel {
  final String job;
  final String department;
  final String creditId;
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String character;
  final int order;

  SeriesEpisodeCrewModel({
    required this.job,
    required this.department,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  factory SeriesEpisodeCrewModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesEpisodeCrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesEpisodeCrewModelToJson(this);
}
