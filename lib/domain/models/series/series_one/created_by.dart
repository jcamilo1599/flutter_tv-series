import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreatedByModel {
  final int? id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  CreatedByModel({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByModelToJson(this);
}
