import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class ProvinceEntity {
  final int id;

  @JsonKey(name: "nama")
  final String name;

  ProvinceEntity({this.id, this.name});

  factory ProvinceEntity.fromJson(Map<String, dynamic> json) =>
      _$ProvinceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceEntityToJson(this);
}
