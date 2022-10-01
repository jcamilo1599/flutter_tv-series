import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguageModel {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguageModel({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
