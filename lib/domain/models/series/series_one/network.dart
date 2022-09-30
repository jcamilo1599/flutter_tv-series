import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkModel {
  final int? id;
  final String? name;
  final String? logoPath;
  final String? originCountry;

  NetworkModel({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkModelToJson(this);
}
